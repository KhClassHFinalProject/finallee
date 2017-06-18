<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>HTML5 Audio Player with Responsive Playlist</title>
  <script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js?ver=1.2"></script>
  
  		<!-- 음성인식 js css -->
		<script src="/lee/resources/audio/voice/js/main.js"></script>
		<script src="/lee/resources/audio/voice/js/highlight.min.js"></script>
		<script src="/lee/resources/audio/voice/js/DetectRTC.js"></script>
		<script src="/lee/resources/audio/voice/js/global.js?ver=1.0"></script>
		<script src="/lee/resources/audio/voice/js/jquery.js?ver=1.0"></script>
		<link href="/lee/resources/audio/voice/css/style.css" type="text/css" rel="stylesheet">
		<link href="/lee/resources/audio/voice/css/github-gist.css" type="text/css" rel="stylesheet">
		<link href="/lee/resources/audio/voice/css/main.css" rel="stylesheet" type="text/css" />
		
  		<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
  		<script src='/lee/resources/audio/js/audioJs.js'></script>
		<script src='/lee/resources/audio/js/mediaJs.js'></script>
		<script src="/lee/resources/audio/audioPlayer.js?ver=1.3"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  
  <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
      /* Font Family
================================================== */

@import url("/lee/resources/audio/css/fontCss.css");


/* Desktop
================================================== */

#container { position:relative; margin: auto; width:700px; }
.column { width:inherit; }


/* Tablet (Portrait)
================================================== */

@media only screen and (min-width: 768px) and (max-width: 959px) {
#container { width:556px; }
}


/* Mobile (Portrait)
================================================== */

@media only screen and (max-width: 767px) {
#container { width:300px; }
}


/* Mobile (Landscape)
================================================== */

@media only screen and (min-width: 480px) and (max-width: 767px) {
#container { width:420px; }
}


/* CSS Reset
================================================== */

html,body,div,span,h1,h6,p,a,ul,li,audio {
border:0;
font:inherit;
font-size:100%;
margin:0;
padding:0;
vertical-align:baseline;
}

body { line-height:1; }
ul { list-style:none; }


/* Basic Styles
================================================== */

html,body {
-webkit-font-smoothing:antialiased;
-webkit-text-size-adjust:100%;
background-color:#f6f6f6;
color:#C8C7C8;
font:20px/24px "Yanone Kaffeesatz", HelveticaNeue, "Helvetica Neue", Helvetica, Arial, sans-serif;
font-weight:300;
padding:5px 0;
}

* {
-webkit-tap-highlight-color:rgba(0,0,0,0);
-webkit-tap-highlight-color:transparent;
}


/* Typography
================================================== */

h1,h6,p { color:#808080; font-weight:200; }
h1 { font-size:42px; line-height:44px; margin:20px 0 0; }
h6 { font-size:18px; line-height:20px; margin:4px 0 20px; }
p { font-size:18px; line-height:20px; margin:0 0 2px; }


/* Links
================================================== */

a,a:visited { color:#ddd; outline:0; text-decoration:underline; }
a:hover,a:focus { color:#bbb; }
p a,p a:visited { line-height:inherit; }


/* Misc.
================================================== */

.add-bottom { margin-bottom:20px !important; }
.left { float:left; }
.right { float:right; }
.center { text-align:center; }


/* Custom Styles
================================================== */

/* Highlight Styles */
::selection { background-color:#262223; color:#444; }


/* Audio Player Styles
================================================== */

/* Default / Desktop / Firefox */
audio { margin:0 15px 0 14px; width:670px; }
#mainwrap { box-shadow:0 0 6px 1px rgba(0,0,0,.25); }
#audiowrap { background-color:#231F20; margin:0 auto; }
#plwrap { margin:0 auto; }
#tracks { position:relative; text-align:center; }
#nowPlay { display:inline; }
#npTitle { margin:0; padding:21px; text-align:right; }
#npAction { padding:21px; position:absolute; }
#plList { margin:0; }
#plList li { background-color:#231F20; cursor:pointer; display:block; margin:0; padding:21px 0; }
#plList li:hover { background-color:#262223; }
.plItem { position:relative; }
.plTitle { left:50px; overflow:hidden; position:absolute; right:65px; text-overflow:ellipsis; top:0; white-space:nowrap; }
.plNum { padding-left:21px; width:25px; }
.plLength { padding-left:21px; position:absolute; right:21px; top:0; }
.plSel,.plSel:hover { background-color:#262223!important; cursor:default!important; }
a[id^="btn"] { background-color:#231F20; color:#C8C7C8; cursor:pointer; display:inline-block; font-size:50px; margin:0; padding:21px 27px; text-decoration:none; }
a[id^="btn"]:last-child { margin-left:-4px; }
a[id^="btn"]:hover,a[id^="btn"]:active { background-color:#262223; }
a[id^="btn"]::-moz-focus-inner { border:0; padding:0; }


/* 배속 및 시간 조절용 CSS	  */
/* #optionTest{
	text-align: center;
}
#btnTest{
	background-color:#EEEEEE;
	display: inline-block;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 13px/100% Arial, Helvetica, sans-serif;
	padding: .2em 2em .30em;
	text-shadow: 0 1px 1px rgba(0,0,0,.3);
	-webkit-border-radius: .5em; 
	-moz-border-radius: .5em;
	border-radius: .5em;
	-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	box-shadow: 0 1px 2px rgba(0,0,0,.2);
}
 */
/* IE 9 */
html[data-useragent*="MSIE 9.0"] audio { margin-left:9px; outline:none; width:680px; }
html[data-useragent*="MSIE 9.0"] #audiowrap { background-color:#000; }
html[data-useragent*="MSIE 9.0"] a[id^="btn"] { background-color:#000; }
html[data-useragent*="MSIE 9.0"] a[id^="btn"]:hover { background-color:#080808; }
html[data-useragent*="MSIE 9.0"] #plList li { background-color:#000; }
html[data-useragent*="MSIE 9.0"] #plList li:hover { background-color:#080808; }
html[data-useragent*="MSIE 9.0"] .plSel,
html[data-useragent*="MSIE 9.0"] .plSel:hover { background-color:#080808!important; }

/* IE 10 */
html[data-useragent*="MSIE 10.0"] audio { margin-left:6px; width:687px; }
html[data-useragent*="MSIE 10.0"] #audiowrap { background-color:#000; }
html[data-useragent*="MSIE 10.0"] a[id^="btn"] { background-color:#000; }
html[data-useragent*="MSIE 10.0"] a[id^="btn"]:hover { background-color:#080808; }
html[data-useragent*="MSIE 10.0"] #plList li { background-color:#000; }
html[data-useragent*="MSIE 10.0"] #plList li:hover { background-color:#080808; }
html[data-useragent*="MSIE 10.0"] .plSel,
html[data-useragent*="MSIE 10.0"] .plSel:hover { background-color:#080808!important; }

/* IE 11 */
html[data-useragent*="rv:11.0"] audio { margin-left:2px; width:695px; }
html[data-useragent*="rv:11.0"] #audiowrap { background-color:#000; }
html[data-useragent*="rv:11.0"] a[id^="btn"] { background-color:#000; }
html[data-useragent*="rv:11.0"] a[id^="btn"]:hover { background-color:#080808; }
html[data-useragent*="rv:11.0"] #plList li { background-color:#000; }
html[data-useragent*="rv:11.0"] #plList li:hover { background-color:#080808; }
html[data-useragent*="rv:11.0"] .plSel,
html[data-useragent*="rv:11.0"] .plSel:hover { background-color:#080808!important; }

/* All Apple Products */
html[data-useragent*="Apple"] audio { margin:0; width:100%; }
html[data-useragent*="Apple"] #audiowrap { background-color:#000; }
html[data-useragent*="Apple"] a[id^="btn"] { background-color:#000; }
html[data-useragent*="Apple"] a[id^="btn"]:hover { background-color:#080808; }
html[data-useragent*="Apple"] #plList li { background-color:#000; }
html[data-useragent*="Apple"] #plList li:hover { background-color:#080808; }
html[data-useragent*="Apple"] .plSel,
html[data-useragent*="Apple"] .plSel:hover { background-color:#080808!important; }

/* IOS 7 */
html[data-useragent*="OS 7"] body { color:#373837; }
html[data-useragent*="OS 7"] audio { margin-left:3px; width:690px; }
html[data-useragent*="OS 7"] #audiowrap { background-color:#e6e6e6; }
html[data-useragent*="OS 7"] a[id^="btn"] { background-color:#e6e6e6; color:#373837; }
html[data-useragent*="OS 7"] a[id^="btn"]:hover { background-color:#eee; }
html[data-useragent*="OS 7"] #plList li { background-color:#e6e6e6; }
html[data-useragent*="OS 7"] #plList li:hover { background-color:#eee; }
html[data-useragent*="OS 7"] .plSel,
html[data-useragent*="OS 7"] .plSel:hover { background-color:#eee!important; }

/* IOS 8 */
html[data-useragent*="OS 8"] body { color:#373837; }
html[data-useragent*="OS 8"] audio { margin-left:6px; width:694px; }
html[data-useragent*="OS 8"] #audiowrap { background-color:#e4e4e4; }
html[data-useragent*="OS 8"] a[id^="btn"] { background-color:#e4e4e4; color:#373837; }
html[data-useragent*="OS 8"] a[id^="btn"]:hover { background-color:#eee; }
html[data-useragent*="OS 8"] #plList li { background-color:#e4e4e4; }
html[data-useragent*="OS 8"] #plList li:hover { background-color:#eee; }
html[data-useragent*="OS 8"] .plSel,
html[data-useragent*="OS 8"] .plSel:hover { background-color:#eee!important; }

/* IOS 9 */
html[data-useragent*="OS 9"] body { color:#373837; }
html[data-useragent*="OS 9"] audio { margin-left:6px; width:694px; }
html[data-useragent*="OS 9"] #audiowrap { background-color:#d5d5d5; }
html[data-useragent*="OS 9"] a[id^="btn"] { background-color:#d5d5d5; color:#373837; }
html[data-useragent*="OS 9"] a[id^="btn"]:hover { background-color:#eee; }
html[data-useragent*="OS 9"] #plList li { background-color:#d5d5d5; }
html[data-useragent*="OS 9"] #plList li:hover { background-color:#eee; }
html[data-useragent*="OS 9"] .plSel,
html[data-useragent*="OS 9"] .plSel:hover { background-color:#eee!important; }

/* Chrome */
html[data-useragent*="Chrome"] body { color:#5a5a5a; }
html[data-useragent*="Chrome"] audio { margin-left:9px; width:677px; }
html[data-useragent*="Chrome"] #audiowrap { background-color:#fafafa; }
html[data-useragent*="Chrome"] a[id^="btn"] { background-color:#fafafa; color:#5a5a5a; }
html[data-useragent*="Chrome"] a[id^="btn"]:hover { background-color:#eee; }
html[data-useragent*="Chrome"] #plList li { background-color:#fafafa; }
html[data-useragent*="Chrome"] #plList li:hover { background-color:#eee; }
html[data-useragent*="Chrome"] .plSel,
html[data-useragent*="Chrome"] .plSel:hover { background-color:#eee!important; }

/* Chrome / Android / Tablet */
html[data-useragent*="Chrome"][data-useragent*="Android"] body { color:#373837; }
html[data-useragent*="Chrome"][data-useragent*="Android"] audio { margin-left:4px; width:689px; }
html[data-useragent*="Chrome"][data-useragent*="Android"] #audiowrap { background-color:#fafafa; }
html[data-useragent*="Chrome"][data-useragent*="Android"] a[id^="btn"] { background-color:#fafafa; color:#373837; }
html[data-useragent*="Chrome"][data-useragent*="Android"] a[id^="btn"]:hover { background-color:#eee; }
html[data-useragent*="Chrome"][data-useragent*="Android"] #plList li { background-color:#fafafa; }
html[data-useragent*="Chrome"][data-useragent*="Android"] #plList li:hover { background-color:#eee; }
html[data-useragent*="Chrome"][data-useragent*="Android"] .plSel,
html[data-useragent*="Chrome"][data-useragent*="Android"] .plSel:hover { background-color:#eee!important; }


/* Audio Player Media Queries
================================================== */

/* Tablet Portrait */
@media only screen and (min-width: 768px) and (max-width: 959px) {
audio { width:526px; }
html[data-useragent*="MSIE 9.0"] audio { width:536px; }
html[data-useragent*="MSIE 10.0"] audio { width:543px; }
html[data-useragent*="rv:11.0"] audio { width:551px; }
html[data-useragent*="OS 7"] audio { width:546px; }
html[data-useragent*="OS 8"] audio { width:550px; }
html[data-useragent*="OS 9"] audio { width:550px; }
html[data-useragent*="Chrome"] audio { width:533px; }
html[data-useragent*="Chrome"][data-useragent*="Android"] audio { margin-left:4px; width:545px; }
}

/* Mobile Landscape */
@media only screen and (min-width: 480px) and (max-width: 767px) {
audio { width:390px; }
html[data-useragent*="MSIE 9.0"] audio { width:400px; }
html[data-useragent*="MSIE 10.0"] audio { width:407px; }
html[data-useragent*="rv:11.0"] audio { width:415px; }
html[data-useragent*="OS 7"] audio { width:410px; }
html[data-useragent*="OS 8"] audio { width:414px; }
html[data-useragent*="OS 9"] audio { width:414px; }
html[data-useragent*="Chrome"] audio { width:397px; }
html[data-useragent*="Chrome"][data-useragent*="Mobile"] audio { margin-left:4px; width:410px; }
#npTitle { width:245px; }
}

/* Mobile Portrait */
@media only screen and (max-width: 479px) {
audio { width:270px; }
html[data-useragent*="MSIE 9.0"] audio { width:280px; }
html[data-useragent*="MSIE 10.0"] audio { width:287px; }
html[data-useragent*="rv:11.0"] audio { width:295px; }
html[data-useragent*="OS 7"] audio { width:290px; }
html[data-useragent*="OS 8"] audio { width:294px; }
html[data-useragent*="OS 9"] audio { width:294px; }
html[data-useragent*="Chrome"] audio { width:277px; }
html[data-useragent*="Chrome"][data-useragent*="Mobile"] audio { margin-left:4px; width:290px; }
#npTitle { width:167px; }
}
audio::-internal-media-controls-download-button {/* 오디오 다운 버튼 삭제 css */
	display:none;
}

audio::-webkit-media-controls-enclosure {
    overflow:hidden;
}
audio::-webkit-media-controls-panel {
    width: calc(100% + 30px); /* Adjust as needed */
}

    </style>

  <script src="/lee/resources/audio/js/prefixJs.js"></script>

<script type="text/javascript">
	var idx = location.search;
	var idxArray = idx.split("=");
	var elIdx = idxArray[1];
	
	$(document).ready(function() { 
		$('#btn-mic').trigger('click');
		console.log($("#btn-mic").prop("class"));
	});
	
</script>

</head>

<body>
  <div id="container">
    <div class="column add-bottom">
        <div id="mainwrap">
            <div id="nowPlay">
                <span class="left" id="npAction">Paused...</span>
                <span class="right" id="npTitle"></span>
            </div>
            <div id="audiowrap">
                <div id="audio0">
                    <audio preload id="audio1"  controls="controls">Your browser does not support HTML5 Audio!</audio>
                </div>
                <div id="tracks">
                    <a id="btnPrev">&laquo;</a>
                    <a id="btnNext">&raquo;</a>
                </div>
                <div class="row" id="optionTest">

                	<div class="col-md-12" style="text-align: center;">
		                <button class="btn btn-default" id="btnTest" onclick="getAudioSpeedDown()">느리게</button>
		                <button class="btn btn-default" id="btnTest" onclick="getAudioSpeedNormal()">기본 속도</button>
		                <button class="btn btn-default" id="btnTest" onclick="getAudioSpeedUp()">빠르게</button>
		                <button class="btn btn-default voicePlay" id="btnTest" onclick="getAudioPlay()">재생</button>
		                <button class="btn btn-default voicePause" id="btnTest" onclick="getAudioPause()">정지</button>
	                </div>
	             </div>
	             <div class="col-md-12" style="text-align: center;">
	                <button class="btn btn-default" id="btnTest" onclick="getAudioTimeBefore()"><span class="glyphicon glyphicon-backward" aria-hidden="true"></span></button>
	                <button class="btn btn-default" id="btnTest" onclick="getAudioTimeAfter()"><span class="glyphicon glyphicon-forward" aria-hidden="true"></span></button>
                </div>
                <br>
            </div>
            <div id="plwrap">
                <ul id="plList"></ul>
            </div>
            <div class="wrap">
					<!-- 마이크 -->
					<button id="btn-mic" class="off"><span></span></button>
			</div>
        </div>
    </div>
</div>
</body>
</html>
