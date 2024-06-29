

$(document).ready(function () {
    $(".btnExcelExport").on('click', function () {
        let originalTable = document.getElementsByTagName("table")[0];
        let rows = originalTable.rows;
        console.log(rows);
        // Create a new table for transformed data
        let newTable = document.createElement("table");
        let headerRow = newTable.insertRow();

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
        totalPresentHeader.innerHTML = "Total Present";
        let totalAbsentHeader = headerRow.insertCell();
        totalAbsentHeader.innerHTML = "Total Absent";

        // Fill the attendance status for each name
        names.forEach(name => {
            let attendanceRow = newTable.insertRow();
            let nameCell = attendanceRow.insertCell();
            nameCell.innerHTML = name;
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
                    if (nameCell === name && dateCell === date && checkInCell !== "") {
                        present = true;
                        break;
                    }
                    else if (nameCell == "" && dateCell != date && checkInCell == "") {
                        holiday = true;
                        break;
                    }
                }
                // if (holiday) {
                //     attendanceCell.innerHTML = "Holiday";
                // } else {
                    
                //     attendanceCell.innerHTML = present ? "Present" : "Absent";
                // }
                attendanceCell.innerHTML = present ? "Present" : "Absent";
                attendanceCell.style.backgroundColor = present ? "green" : "red";
                if (present) {
                    totalPresent++;
                } else {
                    totalAbsent++;
                }
            }); 
            let totalPresentCell = attendanceRow.insertCell();
            totalPresentCell.innerHTML = totalPresent;
            let totalAbsentCell = attendanceRow.insertCell();
            totalAbsentCell.innerHTML = totalAbsent;

        });

        console.log(newTable);
        // Export the new table
        TableToExcel.convert(newTable, {
            name: `export.xlsx`, // fileName you could use any name
            sheet: {
                name: 'Sheet 1' // sheetName
            }
        });
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
