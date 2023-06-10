var latitudeAndLongitude;
const checkPermissionLocation = () => {
    navigator.permissions.query({name: "geolocation"}).then((res) => {
        showPopUpOrScan(res.state);
        res.addEventListener("change", () => {
            showPopUpOrScan(res.state);
            location.reload()
        });
    })
}
const showPopUpOrScan = (state) => {
    console.log("state permission : " + state);
    if (state === "denied") {
        Swal.fire(
            'Gps anda sepertinya tidak aktif.',
            'Mohon periksa kembali gps anda!',
            'question'
        )
    } else {
        navigator.geolocation.getCurrentPosition(
            success,
            error
        );
        window.addEventListener('load', function () {
            let selectedDeviceId;
            let audio = new Audio("assets/audio/beep.mp3");
            const codeReader = new ZXing.BrowserQRCodeReader()
            console.log('ZXing code reader initialized')
            codeReader.getVideoInputDevices()
            .then((videoInputDevices) => {
                const sourceSelect = document.getElementById('sourceSelect')
                selectedDeviceId = videoInputDevices[0].deviceId
                if (videoInputDevices.length >= 1) {
                    videoInputDevices.forEach((element) => {
                        const sourceOption = document.createElement('option')
                        sourceOption.text = element.label
                        sourceOption.value = element.deviceId
                        sourceSelect.appendChild(sourceOption)
                    })
                    sourceSelect.onchange = () => {
                        selectedDeviceId = sourceSelect.value;
                    };
                    const sourceSelectPanel = document.getElementById('sourceSelectPanel')
                    sourceSelectPanel.style.display = 'block'
                }
                codeReader.decodeFromInputVideoDevice(selectedDeviceId, 'video').then((result) => {
                    result['latitudeAndLongitude'] = latitudeAndLongitude
                    console.log(result)            
                    document.getElementById('result').textContent = result.text
                    document.getElementById('latitudeAndLongitude').textContent = result.latitudeAndLongitude
                    if(result != null && result.latitudeAndLongitude != null){
                        audio.play();
                        $('#button').submit();
                    } else {
                        Swal.fire(
                            'Gps anda sepertinya tidak aktif.',
                            'Mohon periksa kembali gps anda!',
                            'question'
                        )
                    }
                }).catch((err) => {
                    console.error(err)
                    document.getElementById('result').textContent = err
                })
                console.log(`Started continous decode from camera with id ${selectedDeviceId}`)
            })
            .catch((err) => {
                console.error(err)
            })
        })
    }
}

const success = (pos) => {
    const crd = pos.coords;
    // console.log("Your current position is:");
    console.log(`Latitude : ${crd.latitude}`);
    console.log(`Longitude: ${crd.longitude}`);
    // console.log(`More or less ${crd.accuracy} meters.`);
    latitudeAndLongitude = crd.latitude + "," + crd.longitude;
    
    return latitudeAndLongitude;
}

const error = (err) => {
    console.warn(`ERROR(${err.code}): ${err.message}`);
}
checkPermissionLocation();
