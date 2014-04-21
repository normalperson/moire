$(document).ready(function() {
	$('.tree > ul').attr('role', 'tree').find('ul').attr('role', 'group');
	$('.tree').find('li:has(ul)').addClass('parent_li').attr('role', 'treeitem').find(' > span > i').attr('title', 'Collapse this branch').on('click', function (e) {
        var children = $(this).closest('li.parent_li').find(' > ul > li');
        if (children.is(':visible')) {
    		children.hide('fast');
    		$(this).attr('title', 'Expand this branch').addClass('glyphicon-plus-sign').removeClass('glyphicon-minus-sign');
        }
        else {
    		children.show('fast');
    		$(this).attr('title', 'Collapse this branch').addClass('glyphicon-minus-sign').removeClass('glyphicon-plus-sign');
        }
        e.stopPropagation();
    });
});