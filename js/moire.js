var printJobWin;
function printJobPreview(jobID){
	printJobWin = window.open('/moire/web/Moire/printJob?jobid='+jobID, 'printJobWin', 'width=1024,height=600,scrollbars=1,toolbar=1');
	printJobWin.focus();
}
function printInvoicePreview(invoiceID){
	printJobWin = window.open('/moire/web/Moire/printInvoice?invoiceid='+invoiceID, 'printJobWin', 'width=1024,height=600,scrollbars=1,toolbar=1');
	printJobWin.focus();
}