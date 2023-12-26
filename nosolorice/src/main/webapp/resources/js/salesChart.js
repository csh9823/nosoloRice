	var chartData = [];
	
	let salesLabel = $(".salesLabel");
	let salesValue = $(".salesValue");
	
	for(let i=0; i < salesLabel.length; i++){
		if( i != 0 && $(salesLabel[i]).text() == $(salesLabel[i-1]).text() ){		
			chartData[chartData.length-1].value = parseInt(chartData[chartData.length-1].value) +  parseInt($(salesValue[i]).text());
		} else {
			let datas = { label : $(salesLabel[i]).text(), value : $(salesValue[i]).text() };			
			chartData.push(datas);	
		}
	}

	//월 데이터와 매출 데이터 추출
	var labels = chartData.map(item => item.label);
	var values = chartData.map(item => item.value);
		
	// 차트를 그릴 데이터 정의
	var data = {
		//리스트의 날짜
		labels: labels,
		
		datasets: [{
			backgroundColor: ['#FFB6C1', '#E6E6FA', '#98FB98', '#87CEFA', '#FFFFE0', '#FFD700', '#F5F5DC', '#D8BFD8', '#C1E1C1', '#F08080'],
			borderColor: '#e5e5e5',
			borderWidth: 1,
			
			//리스트의 수수료
			data: values,
			label : '매출액'
			
		}]
	};

	// 차트 옵션 정의 (옵션을 추가하고 싶지 않다면 생략 가능)
	var options = {
		responsive: true,
        maintainAspectRatio: false,
		scales: {
			x: { beginAtZero: true },
			y: { beginAtZero: true }
		}
	};
	
	// canvas 엘리먼트 가져오기
	var ctx = document.getElementById('myChart').getContext('2d');
	
	// 차트 생성
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: data,
		options: options
	});