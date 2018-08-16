<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script src="static/assets/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	/* 
	 利用气象局天气预报的接口，获取未来天气的信息
	 */

	$(function() {
		$.ajax({
			url : "http://wthrcdn.etouch.cn/weather_mini?citykey=101280101",
			type : "GET",

			success : function(result) {
				console.log(result);

			//气象局响应过来的数据
				/* 	{"data":
						{"yesterday":
								昨天：{"date":"8日星期四",
										"high":"高温 13℃",
										"fx":"北风",
										"low":"低温 9℃",
										"fl":"<![CDATA[4-5级]]>",
										"type":"阵雨"},
						"city":"广州",
						"aqi":"47",
						"forecast":[
							         今天： 	{"date":"9日星期五","high":"高温 19℃","fengli":"<![CDATA[3-4级]]>","low":"低温 7℃","fengxiang":"北风","type":"晴"},
							            {"date":"10日星期六","high":"高温 21℃","fengli":"<![CDATA[<3级]]>","low":"低温 9℃","fengxiang":"无持续风向","type":"晴"},
							            {"date":"11日星期天","high":"高温 22℃","fengli":"<![CDATA[<3级]]>","low":"低温 13℃","fengxiang":"无持续风向","type":"晴"},
							            {"date":"12日星期一","high":"高温 24℃","fengli":"<![CDATA[<3级]]>","low":"低温 15℃","fengxiang":"无持续风向","type":"多云"},
							            {"date":"13日星期二","high":"高温 25℃","fengli":"<![CDATA[3-4级]]>","low":"低温 16℃","fengxiang":"东南风","type":"多云"}
						            ],
						 "ganmao":"昼夜温差很大，易发生感冒，请注意适当增减衣服，加强自我防护避免感冒。",
						 "wendu":"19"
						 },
					"status":1000,
					"desc":"OK"} */
				alert(result);
				//由于响应的结果不是json对象，所以先转换成寄送对象
				var resultJson = JSON.parse(result);

				var yesterdayWeath = resultJson.data.yesterday;
				//昨天的天气
				var yesterdayDate = yesterdayWeath.date;
				var yesterdayHigh = yesterdayWeath.high;
				var yesterdayLow = yesterdayWeath.low;
				var yesterdayFx = yesterdayWeath.fx;
				var yesterdayFl = yesterdayWeath.fl;
				var yesterdayType = yesterdayWeath.type;
				alert("日期：" + yesterdayDate + " 最高温度：" + yesterdayHigh
						+ " 最低温度：" + yesterdayLow + " 风向：" + yesterdayFx
						+ " 风力：" + yesterdayFl + " 天气类型：" + yesterdayType);

				alert(resultJson.data.city);

				//天气预报，包括今天内的未来5天
				//alert(resultJson.data.forecast.length)
				for (var i = 0; i < resultJson.data.forecast.length; i++) {
					var Date = resultJson.data.forecast[i].date;
					var High = resultJson.data.forecast[i].high;
					var Low = resultJson.data.forecast[i].low;
					var Fengxiang = resultJson.data.forecast[i].fengxiang;
					var Fengli = resultJson.data.forecast[i].fengli;
					var Type = resultJson.data.forecast[i].type;
					alert("日期：" + Date + " 最高温度：" + High + " 最低温度：" + Low
							+ " 风向：" + Fengxiang + " 风力：" + Fengli + " 天气类型："
							+ Type);

					var DateTd = $("<td></td>").append(
							resultJson.data.forecast[i].date);
					var HighTd = $("<td></td>").append(
							resultJson.data.forecast[i].high);
					var LowTd = $("<td></td>").append(
							resultJson.data.forecast[i].low);
					var FengxiangTd = $("<td></td>").append(
							resultJson.data.forecast[i].fengxiang);
					//截取<![CDATA[<3级]]>
					//	 <![CDATA[4-5级]]>

					var fengli_last = resultJson.data.forecast[i].fengli
							.split("[");
					var fengli_text = fengli_last[fengli_last.length - 1]
							.split("]")[0];
					alert("sas" + fengli_text);
					//获得风力
					var FengliTd = $("<td></td>").append(fengli_text);
					var TypeTd = $("<td></td>").append(
							resultJson.data.forecast[i].type);

					$("<tr></tr>").append(DateTd).append(HighTd).append(LowTd)
							.append(FengxiangTd).append(FengliTd)
							.append(TypeTd).appendTo("#weather_table tbody");
				}
				//alert(resultJson.data.forecast[0].date);

			}
		});

		/* //一个json对象：{"name":"qiming";"phone":"12345679911"}
		var jsonStr="{'name':'qiming'}";
		//把一个字符串转换为json对象
		
		
		var testStr ="alert('hello eval')";
		//使用eval可以把一个字符串转为本地的js代码来执行
		eval(testStr);
		
		//使用eval把json 字符串转为json对象,格式：eval("("+json字符串+")")。
		var testObject = eval("("+jsonStr+")");
		alert(testObject.name); */

	});
</script>
</head>
<body>
	<div>
		<table cellpadding="10" cellspacing="0" border="1" id="weather_table">
			<thead>
				<tr>
					<th>日期</th>
					<th>最高温度</th>
					<th>最低温度</th>
					<th>风向</th>
					<th>风力</th>
					<th>天气类型</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
	</div>
</body>
</html>