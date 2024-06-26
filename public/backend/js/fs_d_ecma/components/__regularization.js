// const { error } = require("jquery");

var url = $('#url').val();
var _token = $('meta[name="csrf-token"]').attr('content');


function checkAttendance() {
    let reg_date = {
        date: document.getElementById('date').value
    };
    let modal_url = $('#form_modal_url').val();

    fetch(modal_url, {
        method: 'post',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': _token
        },
        body: JSON.stringify(reg_date)
    }).then(response => {
        if (!response.ok) {
            console.log(response);
            throw new Error('Network response was not ok ' + response.statusText);
        }
        return response.json();
    }).then(responseData => {
        console.log(responseData);
        if(responseData?.check_in != null && responseData?.check_out != null ){
            console.log("already Checkin");
            // let checkin_time = responseData.check_in;
            // let checkout_time = responseData.check_out;

            // // Extract the time part in HH:MM format
            // let checkin_timeOnly = checkin_time.substring(11, 16);
            // let checkout_timeOnly = checkout_time.substring(11, 16);

            // // Set the value to the time input field
            // document.getElementById('checkin_time').value = checkin_timeOnly;
            // document.getElementById('checkout_time').value = checkout_timeOnly;
            $checkin_input=document.getElementById('checkin_time');
            $checkout_input=document.getElementById('checkout_time');
            $reason=document.getElementById('reason');
            $('.progress').hide();
            
            
            $checkin_input.disabled  = true;
            $checkout_input.disabled  = true;
            $reason.disabled =  true;
            
            Toast.fire({
                icon: 'info',
                title: responseData?.message ?? "Something went Wrong"
            })
        }else if(responseData?.check_in != null && responseData?.check_out == null){
            console.log("Checkout null");

            let checkin_time = responseData.check_in;
            let checkin_timeOnly = checkin_time.substring(11, 16);

            document.getElementById('checkin_time').value = checkin_timeOnly;
            Toast.fire({
                icon: 'warning',
                title: responseData?.message ?? 'Something went wrong.',
                timer: 3000, // Extend time limit to 5 seconds
                
            });
            // checkAttendance()
            $checkin_input=document.getElementById('checkin_time');
            $checkout_input=document.getElementById('checkout_time');
            $reason=document.getElementById('reason');
            // $('.progress').hide();


            $checkin_input.disabled  = false;
            $checkout_input.disabled  = false;
        }
        else{
            console.log("else part");
            $checkin_input=document.getElementById('checkin_time');
            $checkout_input=document.getElementById('checkout_time');
            $reason=document.getElementById('reason');
            $('.progress').show();
            


            $checkin_input.disabled  = false;
            $checkout_input.disabled  = false;
            $reason.disabled =  false;

            Toast.fire({
                icon: 'error',
                title: responseData?.message ?? 'Something went wrong.',
                timer: 3000, // Extend time limit to 5 seconds
            })

        }
    });
}


function btnHold() {
    let duration = 1600,
        success = button => {
            //Success function
            $('.progress').hide();
            button.classList.add('success');
            checkIn($('#form_url').val());
        };
    document.querySelectorAll('.button-hold').forEach(button => {
        button.style.setProperty('--duration', duration + 'ms');
        ['mousedown', 'touchstart', 'keypress'].forEach(e => {
            button.addEventListener(e, ev => {
                if (e != 'keypress' || (e == 'keypress' && ev.which == 32 && !button
                    .classList.contains('process'))) {
                    button.classList.add('process');
                    button.timeout = setTimeout(success, duration, button);
                }
            });
        });
        ['mouseup', 'mouseout', 'touchend', 'keyup'].forEach(e => {
            button.addEventListener(e, ev => {
                if (e != 'keyup' || (e == 'keyup' && ev.which == 32)) {
                    button.classList.remove('process');
                    clearTimeout(button.timeout);
                }
            }, false);
        });
    });

}

btnHold();
var checkUrl;
var checkIn = (url) => {
    checkUrl = url;
    console.log(checkUrl);

    if (navigator?.geolocation) {
        navigator.geolocation.getCurrentPosition(attendanceStore, positionError, { timeout: 10000 });
    } else {
        console.log("Geolocation is not supported by this browser.");
    }
}
function positionError(error) {
    Toast.fire({
        icon: 'error',
        title: error.message ?? 'Something went wrong!',
    })
    $('.progress').show();
    $('#button-hold').removeClass('success');

    attendanceStore();
}

function attendanceStore(position = null) {
    // console.log(position);
    var reason = $('#reason').val();
    var date = $('#date').val();
    var checkIn = $('#checkin_time').val();
    var checkOut = $('#checkout_time').val();
    $('#reason').val()
    if ($('#reason').length > 0 && (reason == '' || reason == null)) {
        $('#reason').focus();
        $('#reason').css('border-color', 'red');
        $('.error_show_reason').html('Please enter reason');
        $('.progress').show();
        $('#button-hold').removeClass('success');
        return false;
    }
    $.ajax({
        type: 'GET',
        url: checkUrl,
        
        data: {
            latitude: position?.coords?.latitude ?? '23.7909811',
            longitude: position?.coords?.longitude ?? '90.4067015',
            remote_mode_in: parseInt($('input[name="place_mode"]:checked').val() ?? 0),
            reason: reason ?? '',
            date: date ?? '',
            checkIn: checkIn ?? '',
            checkOut: checkOut ?? ''
        },
        success: function (data) {
            console.log(data);
            if (data?.result) {
                Toast.fire({
                    icon: 'success',
                    title: data.message,
                    timer: 1500,
                })
                setTimeout(function () {
                    window.location.href = data?.data;
                }, 1500)
            } else {
                Toast.fire({
                    icon: 'success',
                    title: data?.responseJSON?.message ?? 'Regularization Added',
                })
            }
        },
        error: function (data) {
            if (data?.responseJSON?.message) {
                Toast.fire({
                    icon: 'error',
                    title: data?.responseJSON?.message ?? 'Something went wrong.',
                })
                $('.progress').show();
                $('#button-hold').removeClass('success');
                // if (data?.responseJSON?.error) {                    
                //     setTimeout(function () {
                //         window.location.href = data?.responseJSON?.error; 
                //     }, 2000)
                // }
            }
        }
    });
}

textAreaValidate = (value, className) => {
    if (value == '' || value == null) {
        $('.' + className).html('Please enter reason');
        $('.' + className).css('color', 'red');
        return false;
    } else {
        $('.' + className).html('');
        return true;
    }
}