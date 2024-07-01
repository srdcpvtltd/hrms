

$(document).ready(function () {
    $(".btnExcelExport").on('click', function () {
        let originalTable = document.getElementsByTagName("table")[0];
        let rows = originalTable.rows;
        // Create a new table for transformed data
        let newTable = document.createElement("table");
        newTable.style.borderCollapse = "collapse";
        newTable.classList.add("table-bordered");
        let headerRow = newTable.insertRow();
        // headerRow.style.border = "1px solid #dddddd"; 

        // Add headers to the new table
        let nameHeader = headerRow.insertCell();
        nameHeader.innerHTML = "Name"; 
        let dateSet = new Set();

        // Extract unique dates
        for (let i = 1; i < rows.length; i++) {
            let dateCell = rows[i]?.cells[3]?.innerHTML.trim();
            dateSet.add(dateCell);
        }
        console.log(dateSet);
        let dates = Array.from(dateSet).sort();
        console.log(dates);
        dates.forEach(date => {
            let dayHeader = headerRow.insertCell();
            dayHeader.style.border = "1px solid #dddddd";
            dayHeader.innerHTML = date;
        });

        // Extract unique names
        let nameSet = new Set();
        for (let i = 1; i < rows.length; i++) {
            let nameCell = rows[i].cells[2].innerHTML.trim();
            nameSet.add(nameCell);
        }

        let names = Array.from(nameSet);

        // Add "Total Present" and "Total Absent" headers
        let totalPresentHeader = headerRow.insertCell();
        totalPresentHeader.style.border = "1px solid #dddddd";
        totalPresentHeader.innerHTML = "Total Present";

        let totalAbsentHeader = headerRow.insertCell();
        totalAbsentHeader.style.border = "1px solid #dddddd";
        totalAbsentHeader.innerHTML = "Total Absent";

        // Fill the attendance status for each name
        names.forEach(name => {
            let attendanceRow = newTable.insertRow();
            let nameCell = attendanceRow.insertCell();
            nameCell.style.border = "1px solid #dddddd";
            
            let $html = $(name);
            let innername = $html.text();
            nameCell.innerHTML = innername;
            let totalPresent = 0;
            let totalAbsent = 0;
            dates.forEach(date => {
                let attendanceCell = attendanceRow.insertCell();
                let present = false;
                let holiday = false;
                for (let i = 1; i < rows.length; i++) {
                    let nameCell = rows[i].cells[2].innerHTML.trim();
                    let dateCell = rows[i].cells[3].innerHTML.trim();
                    let checkInCell = rows[i].cells[7].innerHTML.trim();
                    
                    // dateCell.style.color = 'green';
                    if (nameCell === name && dateCell === date && checkInCell !== "") {
                        present = true;
                        break;
                    }
                    else if (nameCell == "" && dateCell != date && checkInCell == "") {
                        holiday = true;
                        break;
                    }
                }
                attendanceCell.innerHTML = present ? "Present" : "Absent";
                // attendanceCell.style.backgroundColor = present ? "green" : "red";
                attendanceCell.style.color = present ? "green" : "red";
                
                if (present) {
                    totalPresent++;
                } else {
                    totalAbsent++;
                }
                attendanceCell.style.border = "1px solid #dddddd";
            }); 
            let totalPresentCell = attendanceRow.insertCell();
            totalPresentCell.style.border = "1px solid #dddddd";
            totalPresentCell.innerHTML = totalPresent;
            let totalAbsentCell = attendanceRow.insertCell();
            totalAbsentCell.style.border = "1px solid #dddddd";
            totalAbsentCell.innerHTML = totalAbsent;
            
             

        });

        console.log(newTable);
        let tableHTML = newTable.outerHTML;

        // Create a blob with HTML content
        let blob = new Blob([tableHTML], { type: 'text/html' });

        // Create download link
        let link = document.createElement('a');
        link.href = URL.createObjectURL(blob);
        link.download = 'export.xlsx'; // Specify filename for download

        // Append link to body and trigger download
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
        // Export the new table
        // TableToExcel.convert(newTable, {
        //     name: `export.xlsx`, // fileName you could use any name
        //     sheet: {
        //         name: 'Sheet 1' // sheetName
        //     }
        // });
    });

    $(".exportPDF").on('click', function () {
        $("#table").tableHTMLExport({ type: 'pdf', filename: 'export.pdf', ignoreColumns: $('th:last-child') });

    });
    $(".exportCSV").on('click', function () {
        $("#table").tableHTMLExport({ type: 'csv', filename: 'export.csv' });

    });
    $(".exportJSON").on('click', function () {
        $("#table").tableHTMLExport({ type: 'json', filename: 'export.json' });

    });
    //https://www.bootdey.com/snippets/view/Receipt-page
    selectElementContents = (el) => {
        var body = document.body, range, sel;
        if (document.createRange && window.getSelection) {
            range = document.createRange();
            sel = window.getSelection();
            sel.removeAllRanges();
            try {
                range.selectNodeContents(el);
                sel.addRange(range);
            } catch (e) {
                range.selectNode(el);
                sel.addRange(range);
            }

            document.execCommand('copy');
            sel.removeAllRanges();
            Toast.fire({
                icon: 'success',
                title: 'Copied to clipboard',
                timer: 1500,
            })

        } else if (body.createTextRange) {
            range = body.createTextRange();
            range.moveToElementText(el);
            range.select();

            document.execCommand('copy');
            Toast.fire({
                icon: 'success',
                title: 'Copied to clipboard',
                timer: 1500,
            })
        }
    }
});
