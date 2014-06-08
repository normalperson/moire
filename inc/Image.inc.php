<?php
/*========================================================================================
COPYRIGHT NOTICE
========================================================================================

FusionCore is a proprietary software exclusively owned by PHI ORION SDN BHD, Malaysia. 
Proprietary software is computer software licensed under exclusive legal right of the copyright holder.
The licensee is given the right to use the software under certain conditions, but restricted from other uses, such as modification, further distribution, or reverse engineering.

Copyright (c) 2013-2014, PHI ORION SDN BHD, Malaysia.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are not permitted.
*/
/**Class Name: Image
  *Description: This is a generic function the handle insert file name and retrieve file info
  *Version: 0.2
  *Last modified on: 7 June 2014
  *Author: Eng
  *Available Features:  
  Single insert
  Retrieve by reference type and key
  saveFile

*/

class Image {

    protected $error_messages = array(
        1 => 'The uploaded file exceeds the upload_max_filesize directive in php.ini',
        2 => 'The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form',
        3 => 'The uploaded file was only partially uploaded',
        4 => 'No file was uploaded',
        6 => 'Missing a temporary folder',
        7 => 'Failed to write file to disk',
        8 => 'A PHP extension stopped the file upload',
        'post_max_size' => 'The uploaded file exceeds the post_max_size directive in php.ini',
        'max_file_size' => 'File is too big',
        'min_file_size' => 'File is too small',
        'accept_file_types' => 'Filetype not allowed',
        'max_number_of_files' => 'Maximum number of files exceeded',
        'max_width' => 'Image exceeds maximum width',
        'min_width' => 'Image requires a minimum width',
        'max_height' => 'Image exceeds maximum height',
        'min_height' => 'Image requires a minimum height',
        'abort' => 'File upload aborted',
        'image_resize' => 'Failed to resize image'
    );


	public $error;
    protected $appdir;
    protected $accept = array("jpg", "jpeg", "gif", "png","JPG", "JPEG", "GIF", "PNG"); // accept file type


	/**
	* do nothing
	* @return void
	*/	
	public function __construct($options= null){
		
		
		$imp = implode('|', $this->accept);
		$imgregexp = '/^.*\.('.$imp.')$/i';

		// Defines which files (based on their names) are accepted for upload: 'accept_file_types' => '/.+$/i',            
		$this->options = array('accept_file_types' => '/.+$/i',
			'max_file_size' => null,
			'min_file_size' => 1,
			'max_number_of_files' => null,
			'accept_file_types' => $imgregexp);		
		
		$this->error = array();
		 if ($options) {
            $this->options = $options + $this->options;
        }		

	}	
	protected function validate($file) {
		$ret = array();
        if ($file["error"]) {
            $this->error = $this->get_error_message($file["error"]);
            return false;
        }        
        $content_length = $this->fix_integer_overflow(intval(
            $this->get_server_var('CONTENT_LENGTH')
        ));
        $post_max_size = $this->get_config_bytes(ini_get('post_max_size'));
        if ($post_max_size && ($content_length > $post_max_size)) {
            $this->error = $this->get_error_message('post_max_size');
            return false;
        }
        if (!preg_match($this->options['accept_file_types'], $file["name"])) {
            $this->error = $this->get_error_message('accept_file_types');
            return false;
        }
        $file_size = $this->get_file_size($file["tmp_name"]);

        if ($this->options['max_file_size'] && $file_size > $this->options['max_file_size'] ){
            $this->error = $this->get_error_message('max_file_size');
        	return false;
        }
        if ($this->options['min_file_size'] &&
            $file_size < $this->options['min_file_size']) {
            $this->error = $this->get_error_message('min_file_size');
        	return false;
        }
        if (is_int($this->options['max_number_of_files']) &&
                ($this->count_file_objects() >= $this->options['max_number_of_files']) &&
                // Ignore additional chunks of existing files:
                !is_file($this->get_upload_path($file["name"]))) {
            $this->error = $this->get_error_message('max_number_of_files');
        	return false;
        }
        return true;
    }	
    protected function get_server_var($id) {
        return isset($_SERVER[$id]) ? $_SERVER[$id] : '';
    }
    protected function get_config_bytes($val) {
        $val = trim($val);
        $last = strtolower($val[strlen($val)-1]);
        switch($last) {
            case 'g':
                $val *= 1024;
            case 'm':
                $val *= 1024;
            case 'k':
                $val *= 1024;
        }
        return $this->fix_integer_overflow($val);
    }

    // Fix for overflowing signed 32 bit integers,
    // works for sizes up to 2^32-1 bytes (4 GiB - 1):
    protected function fix_integer_overflow($size) {
        if ($size < 0) {
            $size += 2.0 * (PHP_INT_MAX + 1);
        }
        return $size;
    }

    protected function get_error_message($error) {
        return array_key_exists($error, $this->error_messages) ?
            $this->error_messages[$error] : $error;
    }

    protected function get_file_size($file_path, $clear_stat_cache = false) {
        if ($clear_stat_cache) {
            if (version_compare(PHP_VERSION, '5.3.0') >= 0) {
                clearstatcache(true, $file_path);
            } else {
                clearstatcache();
            }
        }
        return $this->fix_integer_overflow(filesize($file_path));
    }
	/**
    * Accept file and move to the right directory
    * @param array $file : file destination path
    * @param string $refid : column value
    * @param string $reftype : column name
    * @param boolean $override : true or false
    * @return boolean
    */  
    public function saveImage($file, $filelocation, $newfilename){
        global $DB;

        $status = $this->validate($file);

        if($status){
            

            $tmp = explode(".", $file["name"]);
            $extension = end($tmp);     
            
            $name = $newfilename.".".$extension; // create new filename

            move_uploaded_file($file["tmp_name"],$filelocation.DS.$name);              
            
            return true;
        }
        else return false;

    }    
	public function getImage($foldername,$id){
		    
        foreach ($this->accept as $key => $value) {
            $filename = DOC_DIR.DS.'image'.DS.$foldername.DS.$id.'.'.$value;
            if (file_exists($filename)) {
                $imagelocation = IMAGE_HREF.DS.$foldername.DS.$id.'.'.$value;
                return $imagelocation;
            }
        }

	   return 'File not found';


	}
	protected function human_filesize($bytes, $decimals = 2) {
	  $sz = 'BKMGTP';
	  $factor = floor((strlen($bytes) - 1) / 3);
	  return sprintf("%.{$decimals}f", $bytes / pow(1024, $factor)) . @$sz[$factor];
	}
	

}


?>