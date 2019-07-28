<%--
  User: limingxing
  Date: 2019/7/15
  Time: 9:07
  Describe:显示所有的用户
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
<head>
    <title>echarts表格显示</title>
</head>
<body style="height: 100%; margin: 0">
<div style="margin-left:2%;color:goldenrod;font-size: 20px">携带token值方可进来！！！<a onclick="toMainPage()" style="cursor:pointer;">首页</a></div>
<div id="container" style="height: 90%;margin-top:50px;"></div>
<script type="text/javascript">
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    app.title = '';

    option = {
        title:{
            text:'技术参数等级',
            left:'center',
            textStyle:{
                color:'black',
                //字体风格,'normal','italic','oblique'
                fontStyle:'normal',
                //字体粗细 'normal','bold','bolder','lighter',100 | 200 | 300 | 400...
                fontWeight:'bold',
                //字体系列
                fontFamily:'sans-serif',
                //字体大小
                fontSize:35
            }
        },
        color: ['#3398DB'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true,
            x: 100,
            y2: 200
        },
        color:['#C4C400','#0080FF','#548C00','#0080FF','#548C00'],
        xAxis : [
            {
                type : 'category',//15
                data : ['springmvc', 'spring', 'mybatis', 'docker','springcloud','jenkins','springboot', 'linux', 'hzero','mysql', 'oracle', 'redis', 'git', 'maven','kendoUI', 'boostrap','echarts','java'],
                axisTick: {
                    alignWithLabel: true,
                },
                axisLabel: {
                    show: true,
                    interval: 0,    //强制文字产生间隔
                    rotate: 45,     //文字逆时针旋转45°
                    textStyle: {    //文字样式
                        color: "black",
                        fontSize: 20,
                        fontFamily: 'Microsoft YaHei'
                    }
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                axisLabel: {
                    show: true,
                    interval: 0,    //强制文字产生间隔
                    textStyle: {    //文字样式
                        color: "black",
                        fontSize: 30,
                        fontFamily: 'Microsoft YaHei'
                    }
                }
            }
        ],
        series : [
            {
                name:'直接访问',
                type:'bar',
                barWidth: '60%',
                data:[2, 2, 2,1, 2,1, 2, 2, 1, 2,2,2,2.5, 2,3,2,2,4],
                itemStyle: {
                    normal: {
                        color: function(params) {
                            var colorList = [
                                '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',

                                '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',

                                '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0',
                                '#B5C334','#F3A43B'
                            ];
                            return colorList[params.dataIndex]
                        },
                        label: {
                            show: true,
                            position: 'top',
                            formatter: '{b}\n{c}',
                            textStyle: { //数值样式
                                color: 'black',
                                fontSize: 15
                            }
                        }
                    }
                },
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }

    //跳到主页
    function toMainPage() {
        window.location.href="/srpingboot_hmall_war_exploded/";
    }
</script>

</body>
</html>
