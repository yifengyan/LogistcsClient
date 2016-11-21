<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
#l-map{height:100%;width:78%;float:left;border-right:2px solid #bcbcbc;}
#r-result{height:100%;width:20%;float:left;}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.5&ak=273d0bc9eef480aa77cf844924fe1caa"></script>
<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
<title>GPS转百度</title>
</head>
<body>
<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
//GPS坐标
var xx = 116.397428;
var yy = 39.90923;
var gpsPoint = new BMap.Point(xx,yy);

//地图初始化
var bm = new BMap.Map("allmap");
bm.centerAndZoom(gpsPoint, 15);
bm.addControl(new BMap.NavigationControl());

//添加谷歌marker和label
var markergps = new BMap.Marker(gpsPoint);
bm.addOverlay(markergps); //添加GPS标注
var labelgps = new BMap.Label("我是GPS标注哦",{offset:new BMap.Size(20,-10)});
markergps.setLabel(labelgps); //添加GPS标注

</script>
