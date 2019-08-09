var output = 'OriginID,ScriptName\n';
for (var e of document.querySelectorAll('span')) {
    // Check all span tags for the words HD Automation in inntertext
    if (e.textContent.includes('HD Automation')) {
        if (e.parentElement.tagName === 'DIV') {
            var items = e.parentElement.querySelectorAll('li > span > span');
            console.log(items)
            for (var item of items) {
                output += (item.parentElement).parentElement.id + ',' + item.innerText + '\n';
            }
        }
    }
}
var exportCSV = document.createElement('a');
exportCSV.href = 'data:text/csv;charset=utf-8,' + encodeURI(output);
exportCSV.target = '_blank';
exportCSV.download = 'HDAutomation-Name_ID.csv';
exportCSV.click();