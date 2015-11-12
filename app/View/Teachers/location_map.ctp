

	<script src="http://maps.google.com/maps/api/js?sensor=true&language=ja"></script>

</head>
<body>
	<p id="coment">map</p>
	<div id="locatemap"></div>
	<script>
		var latlng = new google.maps.LatLng(35.66, 139.69);
		var options = {
			zoom:15,
			center: latlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById('locatemap'),options);

		if(navigator.geolocation){
			navigator.geolocation.getCurrentPosition(function(position){
				document.getElementById('coment').innerHTML='現在地を中心とした周辺地図です。'
				map.setCenter(new google.maps.LatLng(position.coords.latitude,position.coords.longitude));
		},function(){
					alert('現在地を取得できません！');
					document.getElementById('coment').innerHTML='現在地の取得に失敗したので、渋谷の周辺地図を表示しています。'
				});
			}else{
				alert('対応していません!')
			}
		
	</script>
</body>