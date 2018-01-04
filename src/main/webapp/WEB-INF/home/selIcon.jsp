<%@ page language="Java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>图标选择</title>
<%@ include file="/WEB-INF/include/sys/head.jsp" %>
<style type="text/css">
.fontawesome-icon-list {
	margin-top: 22px;
}

.fontawesome-icon-list .fa-hover a {
	display: block;
	color: #222222;
	line-height: 32px;
	height: 32px;
	padding-left: 10px;
	border-radius: 4px;
}

.fontawesome-icon-list .fa-hover a .fa {
	width: 32px;
	font-size: 14px;
	display: inline-block;
	text-align: right;
	margin-right: 10px;
}

.fontawesome-icon-list .fa-hover a:hover {
	background-color: #ff4d3a;
	color: #ffffff;
	text-decoration: none;
}

.fontawesome-icon-list .fa-hover a:hover .fa {
	font-size: 28px;
	vertical-align: -6px;
}

.fontawesome-icon-list .fa-hover a:hover .text-muted {
	color: #bbe2d5;
}
</style>
</head>
<body>
	<div
		style="margin: 10px 20px; font-size: 18px; font-weight: bold; border-bottom: 1px solid #eee; padding-bottom: 5px">网页图标</div>
	<div class="row fontawesome-icon-list" style="margin-top: 0px">
		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-address-book"
				aria-hidden="true"></i> address-book</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-address-book-o"
				aria-hidden="true"></i> address-book-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-address-card"
				aria-hidden="true"></i> address-card</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-address-card-o"
				aria-hidden="true"></i> address-card-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-adjust" aria-hidden="true"></i>
				adjust</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i
				class="fa fa-american-sign-language-interpreting" aria-hidden="true"></i>
				american-sign-language-interpreting</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-anchor" aria-hidden="true"></i>
				anchor</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-archive" aria-hidden="true"></i>
				archive</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-area-chart"
				aria-hidden="true"></i> area-chart</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrows" aria-hidden="true"></i>
				arrows</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrows-h" aria-hidden="true"></i>
				arrows-h</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrows-v" aria-hidden="true"></i>
				arrows-v</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-asl-interpreting"
				aria-hidden="true"></i> asl-interpreting </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-assistive-listening-systems"
				aria-hidden="true"></i> assistive-listening-systems</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-asterisk" aria-hidden="true"></i>
				asterisk</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-at" aria-hidden="true"></i>
				at</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-audio-description"
				aria-hidden="true"></i> audio-description</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-automobile"
				aria-hidden="true"></i> automobile </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-balance-scale"
				aria-hidden="true"></i> balance-scale</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-ban" aria-hidden="true"></i>
				ban</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bank" aria-hidden="true"></i>
				bank</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bar-chart"
				aria-hidden="true"></i> bar-chart</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bar-chart-o"
				aria-hidden="true"></i> bar-chart-o </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-barcode" aria-hidden="true"></i>
				barcode</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bars" aria-hidden="true"></i>
				bars</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bath" aria-hidden="true"></i>
				bath</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bathtub" aria-hidden="true"></i>
				bathtub</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-battery" aria-hidden="true"></i>
				battery</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-battery-0"
				aria-hidden="true"></i> battery-0 </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-battery-1"
				aria-hidden="true"></i> battery-1 </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-battery-2"
				aria-hidden="true"></i> battery-2 </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-battery-3"
				aria-hidden="true"></i> battery-3 </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-battery-4"
				aria-hidden="true"></i> battery-4 </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-battery-empty"
				aria-hidden="true"></i> battery-empty</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-battery-full"
				aria-hidden="true"></i> battery-full</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-battery-half"
				aria-hidden="true"></i> battery-half</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-battery-quarter"
				aria-hidden="true"></i> battery-quarter</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-battery-three-quarters"
				aria-hidden="true"></i> battery-three-quarters</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bed" aria-hidden="true"></i>
				bed</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-beer" aria-hidden="true"></i>
				beer</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bell" aria-hidden="true"></i>
				bell</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bell-o" aria-hidden="true"></i>
				bell-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bell-slash"
				aria-hidden="true"></i> bell-slash</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bell-slash-o"
				aria-hidden="true"></i> bell-slash-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bicycle" aria-hidden="true"></i>
				bicycle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-binoculars"
				aria-hidden="true"></i> binoculars</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-birthday-cake"
				aria-hidden="true"></i> birthday-cake</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-blind" aria-hidden="true"></i>
				blind</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bluetooth"
				aria-hidden="true"></i> bluetooth</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bluetooth-b"
				aria-hidden="true"></i> bluetooth-b</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bolt" aria-hidden="true"></i>
				bolt</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bomb" aria-hidden="true"></i>
				bomb</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-book" aria-hidden="true"></i>
				book</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bookmark" aria-hidden="true"></i>
				bookmark</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bookmark-o"
				aria-hidden="true"></i> bookmark-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-braille" aria-hidden="true"></i>
				braille</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-briefcase"
				aria-hidden="true"></i> briefcase</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bug" aria-hidden="true"></i>
				bug</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-building" aria-hidden="true"></i>
				building</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-building-o"
				aria-hidden="true"></i> building-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bullhorn" aria-hidden="true"></i>
				bullhorn</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bullseye" aria-hidden="true"></i>
				bullseye</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bus" aria-hidden="true"></i>
				bus</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cab" aria-hidden="true"></i>
				cab </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-calculator"
				aria-hidden="true"></i> calculator</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-calendar" aria-hidden="true"></i>
				calendar</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-calendar-check-o"
				aria-hidden="true"></i> calendar-check-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-calendar-minus-o"
				aria-hidden="true"></i> calendar-minus-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-calendar-o"
				aria-hidden="true"></i> calendar-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-calendar-plus-o"
				aria-hidden="true"></i> calendar-plus-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-calendar-times-o"
				aria-hidden="true"></i> calendar-times-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-camera" aria-hidden="true"></i>
				camera</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-camera-retro"
				aria-hidden="true"></i> camera-retro</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-car" aria-hidden="true"></i>
				car</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-caret-square-o-down"
				aria-hidden="true"></i> caret-square-o-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-caret-square-o-left"
				aria-hidden="true"></i> caret-square-o-left</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-caret-square-o-right"
				aria-hidden="true"></i> caret-square-o-right</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-caret-square-o-up"
				aria-hidden="true"></i> caret-square-o-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cart-arrow-down"
				aria-hidden="true"></i> cart-arrow-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cart-plus"
				aria-hidden="true"></i> cart-plus</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cc" aria-hidden="true"></i>
				cc</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-certificate"
				aria-hidden="true"></i> certificate</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-check" aria-hidden="true"></i>
				check</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-check-circle"
				aria-hidden="true"></i> check-circle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-check-circle-o"
				aria-hidden="true"></i> check-circle-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-check-square"
				aria-hidden="true"></i> check-square</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-check-square-o"
				aria-hidden="true"></i> check-square-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-child" aria-hidden="true"></i>
				child</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-circle" aria-hidden="true"></i>
				circle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-circle-o" aria-hidden="true"></i>
				circle-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-circle-o-notch"
				aria-hidden="true"></i> circle-o-notch</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-circle-thin"
				aria-hidden="true"></i> circle-thin</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-clock-o" aria-hidden="true"></i>
				clock-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-clone" aria-hidden="true"></i>
				clone</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-close" aria-hidden="true"></i>
				close</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cloud" aria-hidden="true"></i>
				cloud</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cloud-download"
				aria-hidden="true"></i> cloud-download</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cloud-upload"
				aria-hidden="true"></i> cloud-upload</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-code" aria-hidden="true"></i>
				code</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-code-fork"
				aria-hidden="true"></i> code-fork</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-coffee" aria-hidden="true"></i>
				coffee</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cog" aria-hidden="true"></i>
				cog</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cogs" aria-hidden="true"></i>
				cogs</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-comment" aria-hidden="true"></i>
				comment</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-comment-o"
				aria-hidden="true"></i> comment-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-commenting"
				aria-hidden="true"></i> commenting</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-commenting-o"
				aria-hidden="true"></i> commenting-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-comments" aria-hidden="true"></i>
				comments</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-comments-o"
				aria-hidden="true"></i> comments-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-compass" aria-hidden="true"></i>
				compass</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-copyright"
				aria-hidden="true"></i> copyright</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-creative-commons"
				aria-hidden="true"></i> creative-commons</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-credit-card"
				aria-hidden="true"></i> credit-card</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-credit-card-alt"
				aria-hidden="true"></i> credit-card-alt</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-crop" aria-hidden="true"></i>
				crop</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-crosshairs"
				aria-hidden="true"></i> crosshairs</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cube" aria-hidden="true"></i>
				cube</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cubes" aria-hidden="true"></i>
				cubes</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cutlery" aria-hidden="true"></i>
				cutlery</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-dashboard"
				aria-hidden="true"></i> dashboard </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-database" aria-hidden="true"></i>
				database</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-deaf" aria-hidden="true"></i>
				deaf</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-deafness" aria-hidden="true"></i>
				deafness</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-desktop" aria-hidden="true"></i>
				desktop</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-diamond" aria-hidden="true"></i>
				diamond</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-dot-circle-o"
				aria-hidden="true"></i> dot-circle-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-download" aria-hidden="true"></i>
				download</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-drivers-license"
				aria-hidden="true"></i> drivers-license </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-drivers-license-o"
				aria-hidden="true"></i> drivers-license-o </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-edit" aria-hidden="true"></i>
				edit</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-ellipsis-h"
				aria-hidden="true"></i> ellipsis-h</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-ellipsis-v"
				aria-hidden="true"></i> ellipsis-v</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-envelope" aria-hidden="true"></i>
				envelope</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-envelope-o"
				aria-hidden="true"></i> envelope-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-envelope-open"
				aria-hidden="true"></i> envelope-open</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-envelope-open-o"
				aria-hidden="true"></i> envelope-open-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-envelope-square"
				aria-hidden="true"></i> envelope-square</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-eraser" aria-hidden="true"></i>
				eraser</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-exchange" aria-hidden="true"></i>
				exchange</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-exclamation"
				aria-hidden="true"></i> exclamation</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-exclamation-circle"
				aria-hidden="true"></i> exclamation-circle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-exclamation-triangle"
				aria-hidden="true"></i> exclamation-triangle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-external-link"
				aria-hidden="true"></i> external-link</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-external-link-square"
				aria-hidden="true"></i> external-link-square</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-eye" aria-hidden="true"></i>
				eye</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-eye-slash"
				aria-hidden="true"></i> eye-slash</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-eyedropper"
				aria-hidden="true"></i> eyedropper</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-fax" aria-hidden="true"></i>
				fax</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-feed" aria-hidden="true"></i>
				feed</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-female" aria-hidden="true"></i>
				female</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-fighter-jet"
				aria-hidden="true"></i> fighter-jet</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-archive-o"
				aria-hidden="true"></i> file-archive-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-audio-o"
				aria-hidden="true"></i> file-audio-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-code-o"
				aria-hidden="true"></i> file-code-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-excel-o"
				aria-hidden="true"></i> file-excel-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-image-o"
				aria-hidden="true"></i> file-image-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-movie-o"
				aria-hidden="true"></i> file-movie-o </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-pdf-o"
				aria-hidden="true"></i> file-pdf-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-photo-o"
				aria-hidden="true"></i> file-photo-o </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-picture-o"
				aria-hidden="true"></i> file-picture-o </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-powerpoint-o"
				aria-hidden="true"></i> file-powerpoint-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-sound-o"
				aria-hidden="true"></i> file-sound-o </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-video-o"
				aria-hidden="true"></i> file-video-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-word-o"
				aria-hidden="true"></i> file-word-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-zip-o"
				aria-hidden="true"></i> file-zip-o </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-film" aria-hidden="true"></i>
				film</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-filter" aria-hidden="true"></i>
				filter</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-fire" aria-hidden="true"></i>
				fire</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-fire-extinguisher"
				aria-hidden="true"></i> fire-extinguisher</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-flag" aria-hidden="true"></i>
				flag</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-flag-checkered"
				aria-hidden="true"></i> flag-checkered</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-flag-o" aria-hidden="true"></i>
				flag-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-flash" aria-hidden="true"></i>
				flash</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-flask" aria-hidden="true"></i>
				flask</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-folder" aria-hidden="true"></i>
				folder</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-folder-o" aria-hidden="true"></i>
				folder-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-folder-open"
				aria-hidden="true"></i> folder-open</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-folder-open-o"
				aria-hidden="true"></i> folder-open-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-frown-o" aria-hidden="true"></i>
				frown-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-futbol-o" aria-hidden="true"></i>
				futbol-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-gamepad" aria-hidden="true"></i>
				gamepad</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-gavel" aria-hidden="true"></i>
				gavel</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-gear" aria-hidden="true"></i>
				gear</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-gears" aria-hidden="true"></i>
				gears</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-gift" aria-hidden="true"></i>
				gift</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-glass" aria-hidden="true"></i>
				glass</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-globe" aria-hidden="true"></i>
				globe</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-graduation-cap"
				aria-hidden="true"></i> graduation-cap</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-group" aria-hidden="true"></i>
				group</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-grab-o"
				aria-hidden="true"></i> hand-grab-o </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-lizard-o"
				aria-hidden="true"></i> hand-lizard-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-paper-o"
				aria-hidden="true"></i> hand-paper-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-peace-o"
				aria-hidden="true"></i> hand-peace-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-pointer-o"
				aria-hidden="true"></i> hand-pointer-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-rock-o"
				aria-hidden="true"></i> hand-rock-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-scissors-o"
				aria-hidden="true"></i> hand-scissors-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-spock-o"
				aria-hidden="true"></i> hand-spock-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-stop-o"
				aria-hidden="true"></i> hand-stop-o </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-handshake-o"
				aria-hidden="true"></i> handshake-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hard-of-hearing"
				aria-hidden="true"></i> hard-of-hearing </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hashtag" aria-hidden="true"></i>
				hashtag</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hdd-o" aria-hidden="true"></i>
				hdd-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-headphones"
				aria-hidden="true"></i> headphones</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-heart" aria-hidden="true"></i>
				heart</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-heart-o" aria-hidden="true"></i>
				heart-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-heartbeat"
				aria-hidden="true"></i> heartbeat</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-history" aria-hidden="true"></i>
				history</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-home" aria-hidden="true"></i>
				home</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hotel" aria-hidden="true"></i>
				hotel</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hourglass"
				aria-hidden="true"></i> hourglass</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hourglass-1"
				aria-hidden="true"></i> hourglass-1 </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hourglass-2"
				aria-hidden="true"></i> hourglass-2 </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hourglass-3"
				aria-hidden="true"></i> hourglass-3 </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hourglass-end"
				aria-hidden="true"></i> hourglass-end</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hourglass-half"
				aria-hidden="true"></i> hourglass-half</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hourglass-o"
				aria-hidden="true"></i> hourglass-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hourglass-start"
				aria-hidden="true"></i> hourglass-start</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-i-cursor" aria-hidden="true"></i>
				i-cursor</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-id-badge" aria-hidden="true"></i>
				id-badge</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-id-card" aria-hidden="true"></i>
				id-card</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-id-card-o"
				aria-hidden="true"></i> id-card-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-image" aria-hidden="true"></i>
				image</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-inbox" aria-hidden="true"></i>
				inbox</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-industry" aria-hidden="true"></i>
				industry</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-info" aria-hidden="true"></i>
				info</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-info-circle"
				aria-hidden="true"></i> info-circle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-institution"
				aria-hidden="true"></i> institution </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-key" aria-hidden="true"></i>
				key</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-keyboard-o"
				aria-hidden="true"></i> keyboard-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-language" aria-hidden="true"></i>
				language</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-laptop" aria-hidden="true"></i>
				laptop</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-leaf" aria-hidden="true"></i>
				leaf</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-legal" aria-hidden="true"></i>
				legal</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-lemon-o" aria-hidden="true"></i>
				lemon-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-level-down"
				aria-hidden="true"></i> level-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-level-up" aria-hidden="true"></i>
				level-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-life-bouy"
				aria-hidden="true"></i> life-bouy </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-life-buoy"
				aria-hidden="true"></i> life-buoy </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-life-ring"
				aria-hidden="true"></i> life-ring</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-life-saver"
				aria-hidden="true"></i> life-saver </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-lightbulb-o"
				aria-hidden="true"></i> lightbulb-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-line-chart"
				aria-hidden="true"></i> line-chart</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-location-arrow"
				aria-hidden="true"></i> location-arrow</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-lock" aria-hidden="true"></i>
				lock</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-low-vision"
				aria-hidden="true"></i> low-vision</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-magic" aria-hidden="true"></i>
				magic</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-magnet" aria-hidden="true"></i>
				magnet</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-mail-forward"
				aria-hidden="true"></i> mail-forward </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-mail-reply"
				aria-hidden="true"></i> mail-reply </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-mail-reply-all"
				aria-hidden="true"></i> mail-reply-all </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-male" aria-hidden="true"></i>
				male</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-map" aria-hidden="true"></i>
				map</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-map-marker"
				aria-hidden="true"></i> map-marker</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-map-o" aria-hidden="true"></i>
				map-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-map-pin" aria-hidden="true"></i>
				map-pin</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-map-signs"
				aria-hidden="true"></i> map-signs</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-meh-o" aria-hidden="true"></i>
				meh-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-microchip"
				aria-hidden="true"></i> microchip</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-microphone"
				aria-hidden="true"></i> microphone</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-microphone-slash"
				aria-hidden="true"></i> microphone-slash</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-minus" aria-hidden="true"></i>
				minus</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-minus-circle"
				aria-hidden="true"></i> minus-circle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-minus-square"
				aria-hidden="true"></i> minus-square</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-minus-square-o"
				aria-hidden="true"></i> minus-square-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-mobile" aria-hidden="true"></i>
				mobile</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-mobile-phone"
				aria-hidden="true"></i> mobile-phone </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-money" aria-hidden="true"></i>
				money</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-moon-o" aria-hidden="true"></i>
				moon-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-mortar-board"
				aria-hidden="true"></i> mortar-board </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-motorcycle"
				aria-hidden="true"></i> motorcycle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-mouse-pointer"
				aria-hidden="true"></i> mouse-pointer</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-music" aria-hidden="true"></i>
				music</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-navicon" aria-hidden="true"></i>
				navicon</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-newspaper-o"
				aria-hidden="true"></i> newspaper-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-object-group"
				aria-hidden="true"></i> object-group</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-object-ungroup"
				aria-hidden="true"></i> object-ungroup</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-paint-brush"
				aria-hidden="true"></i> paint-brush</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-paper-plane"
				aria-hidden="true"></i> paper-plane</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-paper-plane-o"
				aria-hidden="true"></i> paper-plane-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-paw" aria-hidden="true"></i>
				paw</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-pencil" aria-hidden="true"></i>
				pencil</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-pencil-square"
				aria-hidden="true"></i> pencil-square</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-pencil-square-o"
				aria-hidden="true"></i> pencil-square-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-percent" aria-hidden="true"></i>
				percent</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-phone" aria-hidden="true"></i>
				phone</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-phone-square"
				aria-hidden="true"></i> phone-square</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-photo" aria-hidden="true"></i>
				photo</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-picture-o"
				aria-hidden="true"></i> picture-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-pie-chart"
				aria-hidden="true"></i> pie-chart</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-plane" aria-hidden="true"></i>
				plane</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-plug" aria-hidden="true"></i>
				plug</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-plus" aria-hidden="true"></i>
				plus</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-plus-circle"
				aria-hidden="true"></i> plus-circle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-plus-square"
				aria-hidden="true"></i> plus-square</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-plus-square-o"
				aria-hidden="true"></i> plus-square-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-podcast" aria-hidden="true"></i>
				podcast</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-power-off"
				aria-hidden="true"></i> power-off</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-print" aria-hidden="true"></i>
				print</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-puzzle-piece"
				aria-hidden="true"></i> puzzle-piece</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-qrcode" aria-hidden="true"></i>
				qrcode</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-question" aria-hidden="true"></i>
				question</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-question-circle"
				aria-hidden="true"></i> question-circle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-question-circle-o"
				aria-hidden="true"></i> question-circle-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-quote-left"
				aria-hidden="true"></i> quote-left</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-quote-right"
				aria-hidden="true"></i> quote-right</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-random" aria-hidden="true"></i>
				random</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-recycle" aria-hidden="true"></i>
				recycle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-refresh" aria-hidden="true"></i>
				refresh</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-registered"
				aria-hidden="true"></i> registered</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-remove" aria-hidden="true"></i>
				remove</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-reorder" aria-hidden="true"></i>
				reorder</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-reply" aria-hidden="true"></i>
				reply</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-reply-all"
				aria-hidden="true"></i> reply-all</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-retweet" aria-hidden="true"></i>
				retweet</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-road" aria-hidden="true"></i>
				road</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-rocket" aria-hidden="true"></i>
				rocket</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-rss" aria-hidden="true"></i>
				rss</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-rss-square"
				aria-hidden="true"></i> rss-square</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-s15" aria-hidden="true"></i>
				s15 </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-search" aria-hidden="true"></i>
				search</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-search-minus"
				aria-hidden="true"></i> search-minus</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-search-plus"
				aria-hidden="true"></i> search-plus</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-send" aria-hidden="true"></i>
				send</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-send-o" aria-hidden="true"></i>
				send-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-server" aria-hidden="true"></i>
				server</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-share" aria-hidden="true"></i>
				share</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-share-alt"
				aria-hidden="true"></i> share-alt</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-share-alt-square"
				aria-hidden="true"></i> share-alt-square</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-share-square"
				aria-hidden="true"></i> share-square</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-share-square-o"
				aria-hidden="true"></i> share-square-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-shield" aria-hidden="true"></i>
				shield</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-ship" aria-hidden="true"></i>
				ship</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-shopping-bag"
				aria-hidden="true"></i> shopping-bag</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-shopping-basket"
				aria-hidden="true"></i> shopping-basket</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-shopping-cart"
				aria-hidden="true"></i> shopping-cart</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-shower" aria-hidden="true"></i>
				shower</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sign-in" aria-hidden="true"></i>
				sign-in</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sign-language"
				aria-hidden="true"></i> sign-language</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sign-out" aria-hidden="true"></i>
				sign-out</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-signal" aria-hidden="true"></i>
				signal</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-signing" aria-hidden="true"></i>
				signing</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sitemap" aria-hidden="true"></i>
				sitemap</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sliders" aria-hidden="true"></i>
				sliders</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-smile-o" aria-hidden="true"></i>
				smile-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-snowflake-o"
				aria-hidden="true"></i> snowflake-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-soccer-ball-o"
				aria-hidden="true"></i> soccer-ball-o </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sort" aria-hidden="true"></i>
				sort</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sort-alpha-asc"
				aria-hidden="true"></i> sort-alpha-asc</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sort-alpha-desc"
				aria-hidden="true"></i> sort-alpha-desc</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sort-amount-asc"
				aria-hidden="true"></i> sort-amount-asc</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sort-amount-desc"
				aria-hidden="true"></i> sort-amount-desc</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sort-asc" aria-hidden="true"></i>
				sort-asc</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sort-desc"
				aria-hidden="true"></i> sort-desc</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sort-down"
				aria-hidden="true"></i> sort-down </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sort-numeric-asc"
				aria-hidden="true"></i> sort-numeric-asc</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sort-numeric-desc"
				aria-hidden="true"></i> sort-numeric-desc</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sort-up" aria-hidden="true"></i>
				sort-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-space-shuttle"
				aria-hidden="true"></i> space-shuttle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-spinner" aria-hidden="true"></i>
				spinner</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-spoon" aria-hidden="true"></i>
				spoon</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-square" aria-hidden="true"></i>
				square</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-square-o" aria-hidden="true"></i>
				square-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-star" aria-hidden="true"></i>
				star</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-star-half"
				aria-hidden="true"></i> star-half</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-star-half-empty"
				aria-hidden="true"></i> star-half-empty </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-star-half-full"
				aria-hidden="true"></i> star-half-full </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-star-half-o"
				aria-hidden="true"></i> star-half-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-star-o" aria-hidden="true"></i>
				star-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sticky-note"
				aria-hidden="true"></i> sticky-note</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sticky-note-o"
				aria-hidden="true"></i> sticky-note-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-street-view"
				aria-hidden="true"></i> street-view</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-suitcase" aria-hidden="true"></i>
				suitcase</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sun-o" aria-hidden="true"></i>
				sun-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-support" aria-hidden="true"></i>
				support</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-tablet" aria-hidden="true"></i>
				tablet</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-tachometer"
				aria-hidden="true"></i> tachometer</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-tag" aria-hidden="true"></i>
				tag</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-tags" aria-hidden="true"></i>
				tags</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-tasks" aria-hidden="true"></i>
				tasks</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-taxi" aria-hidden="true"></i>
				taxi</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-television"
				aria-hidden="true"></i> television</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-terminal" aria-hidden="true"></i>
				terminal</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thermometer"
				aria-hidden="true"></i> thermometer </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thermometer-0"
				aria-hidden="true"></i> thermometer-0 </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thermometer-1"
				aria-hidden="true"></i> thermometer-1 </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thermometer-2"
				aria-hidden="true"></i> thermometer-2 </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thermometer-3"
				aria-hidden="true"></i> thermometer-3 </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thermometer-4"
				aria-hidden="true"></i> thermometer-4 </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thermometer-empty"
				aria-hidden="true"></i> thermometer-empty</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thermometer-full"
				aria-hidden="true"></i> thermometer-full</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thermometer-half"
				aria-hidden="true"></i> thermometer-half</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thermometer-quarter"
				aria-hidden="true"></i> thermometer-quarter</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thermometer-three-quarters"
				aria-hidden="true"></i> thermometer-three-quarters</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thumb-tack"
				aria-hidden="true"></i> thumb-tack</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thumbs-down"
				aria-hidden="true"></i> thumbs-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thumbs-o-down"
				aria-hidden="true"></i> thumbs-o-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thumbs-o-up"
				aria-hidden="true"></i> thumbs-o-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thumbs-up"
				aria-hidden="true"></i> thumbs-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-ticket" aria-hidden="true"></i>
				ticket</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-times" aria-hidden="true"></i>
				times</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-times-circle"
				aria-hidden="true"></i> times-circle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-times-circle-o"
				aria-hidden="true"></i> times-circle-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-times-rectangle"
				aria-hidden="true"></i> times-rectangle </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-times-rectangle-o"
				aria-hidden="true"></i> times-rectangle-o </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-tint" aria-hidden="true"></i>
				tint</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-toggle-down"
				aria-hidden="true"></i> toggle-down </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-toggle-left"
				aria-hidden="true"></i> toggle-left </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-toggle-off"
				aria-hidden="true"></i> toggle-off</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-toggle-on"
				aria-hidden="true"></i> toggle-on</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-toggle-right"
				aria-hidden="true"></i> toggle-right </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-toggle-up"
				aria-hidden="true"></i> toggle-up </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-trademark"
				aria-hidden="true"></i> trademark</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-trash" aria-hidden="true"></i>
				trash</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-trash-o" aria-hidden="true"></i>
				trash-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-tree" aria-hidden="true"></i>
				tree</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-trophy" aria-hidden="true"></i>
				trophy</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-truck" aria-hidden="true"></i>
				truck</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-tty" aria-hidden="true"></i>
				tty</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-tv" aria-hidden="true"></i>
				tv </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-umbrella" aria-hidden="true"></i>
				umbrella</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-universal-access"
				aria-hidden="true"></i> universal-access</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-university"
				aria-hidden="true"></i> university</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-unlock" aria-hidden="true"></i>
				unlock</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-unlock-alt"
				aria-hidden="true"></i> unlock-alt</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-unsorted" aria-hidden="true"></i>
				unsorted</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-upload" aria-hidden="true"></i>
				upload</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-user" aria-hidden="true"></i>
				user</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-user-circle"
				aria-hidden="true"></i> user-circle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-user-circle-o"
				aria-hidden="true"></i> user-circle-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-user-o" aria-hidden="true"></i>
				user-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-user-plus"
				aria-hidden="true"></i> user-plus</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-user-secret"
				aria-hidden="true"></i> user-secret</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-user-times"
				aria-hidden="true"></i> user-times</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-users" aria-hidden="true"></i>
				users</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-vcard" aria-hidden="true"></i>
				vcard</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-vcard-o" aria-hidden="true"></i>
				vcard-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-video-camera"
				aria-hidden="true"></i> video-camera</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-volume-control-phone"
				aria-hidden="true"></i> volume-control-phone</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-volume-down"
				aria-hidden="true"></i> volume-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-volume-off"
				aria-hidden="true"></i> volume-off</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-volume-up"
				aria-hidden="true"></i> volume-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-warning" aria-hidden="true"></i>
				warning</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-wheelchair"
				aria-hidden="true"></i> wheelchair</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-wheelchair-alt"
				aria-hidden="true"></i> wheelchair-alt</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-wifi" aria-hidden="true"></i>
				wifi</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-window-close"
				aria-hidden="true"></i> window-close</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-window-close-o"
				aria-hidden="true"></i> window-close-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-window-maximize"
				aria-hidden="true"></i> window-maximize</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-window-minimize"
				aria-hidden="true"></i> window-minimize</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-window-restore"
				aria-hidden="true"></i> window-restore</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-wrench" aria-hidden="true"></i>
				wrench</a>
		</div>
	</div>

	<div
		style="margin: 10px 20px; font-size: 18px; font-weight: bold; border-bottom: 1px solid #eee; padding-bottom: 5px">辅助功能</div>
	<div class="row fontawesome-icon-list" style="margin-top: 0px">
		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i
				class="fa fa-american-sign-language-interpreting" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>american-sign-language-interpreting</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-asl-interpreting"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>asl-interpreting
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-assistive-listening-systems"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>assistive-listening-systems</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-audio-description"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>audio-description</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-blind" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>blind</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-braille" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>braille</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cc" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>cc</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-deaf" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>deaf</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-deafness" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>deafness <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hard-of-hearing"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hard-of-hearing
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-low-vision"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>low-vision</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-question-circle-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>question-circle-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sign-language"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>sign-language</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-signing" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>signing <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-tty" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>tty</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-universal-access"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>universal-access</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-volume-control-phone"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>volume-control-phone</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-wheelchair"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>wheelchair</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-wheelchair-alt"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>wheelchair-alt</a>
		</div>
	</div>

	<div
		style="margin: 10px 20px; font-size: 18px; font-weight: bold; border-bottom: 1px solid #eee; padding-bottom: 5px">手势</div>
	<div class="row fontawesome-icon-list" style="margin-top: 0px">
		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-grab-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-grab-o
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-lizard-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-lizard-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-o-down"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-o-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-o-left"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-o-left</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-o-right"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-o-right</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-o-up"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-o-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-paper-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-paper-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-peace-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-peace-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-pointer-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-pointer-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-rock-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-rock-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-scissors-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-scissors-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-spock-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-spock-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-stop-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-stop-o
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thumbs-down"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>thumbs-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thumbs-o-down"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>thumbs-o-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thumbs-o-up"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>thumbs-o-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-thumbs-up"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>thumbs-up</a>
		</div>
	</div>

	<div
		style="margin: 10px 20px; font-size: 18px; font-weight: bold; border-bottom: 1px solid #eee; padding-bottom: 5px">运输</div>
	<div class="row fontawesome-icon-list" style="margin-top: 0px">
		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-ambulance"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>ambulance</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-automobile"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>automobile
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bicycle" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>bicycle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bus" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>bus</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cab" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>cab </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-car" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>car</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-fighter-jet"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>fighter-jet</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-motorcycle"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>motorcycle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-plane" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>plane</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-rocket" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>rocket</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-ship" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>ship</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-space-shuttle"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>space-shuttle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-subway" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>subway</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-taxi" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>taxi</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-train" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>train</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-truck" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>truck</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-wheelchair"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>wheelchair</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-wheelchair-alt"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>wheelchair-alt</a>
		</div>
	</div>

	<div
		style="margin: 10px 20px; font-size: 18px; font-weight: bold; border-bottom: 1px solid #eee; padding-bottom: 5px">性别</div>
	<div class="row fontawesome-icon-list" style="margin-top: 0px">
		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-genderless"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>genderless</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-intersex" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>intersex <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-mars" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>mars</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-mars-double"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>mars-double</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-mars-stroke"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>mars-stroke</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-mars-stroke-h"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>mars-stroke-h</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-mars-stroke-v"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>mars-stroke-v</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-mercury" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>mercury</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-neuter" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>neuter</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-transgender"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>transgender</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-transgender-alt"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>transgender-alt</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-venus" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>venus</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-venus-double"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>venus-double</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-venus-mars"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>venus-mars</a>
		</div>
	</div>

	<div
		style="margin: 10px 20px; font-size: 18px; font-weight: bold; border-bottom: 1px solid #eee; padding-bottom: 5px">文件类型</div>
	<div class="row fontawesome-icon-list" style="margin-top: 0px">
		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>file</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-archive-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-archive-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-audio-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-audio-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-code-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-code-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-excel-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-excel-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-image-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-image-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-movie-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-movie-o
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-o" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>file-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-pdf-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-pdf-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-photo-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-photo-o
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-picture-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-picture-o
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-powerpoint-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-powerpoint-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-sound-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-sound-o
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-text"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-text</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-text-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-text-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-video-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-video-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-word-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-word-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-zip-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-zip-o
				</a>
		</div>
	</div>

	<div
		style="margin: 10px 20px; font-size: 18px; font-weight: bold; border-bottom: 1px solid #eee; padding-bottom: 5px">表单</div>
	<div class="row fontawesome-icon-list" style="margin-top: 0px">
		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-check-square"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>check-square</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-check-square-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>check-square-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-circle" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>circle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-circle-o" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>circle-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-dot-circle-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>dot-circle-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-minus-square"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>minus-square</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-minus-square-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>minus-square-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-plus-square"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>plus-square</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-plus-square-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>plus-square-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-square" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>square</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-square-o" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>square-o</a>
		</div>

	</div>

	<div
		style="margin: 10px 20px; font-size: 18px; font-weight: bold; border-bottom: 1px solid #eee; padding-bottom: 5px">支付</div>
	<div class="row fontawesome-icon-list" style="margin-top: 0px">
		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cc-amex" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>cc-amex</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cc-diners-club"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>cc-diners-club</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cc-discover"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>cc-discover</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cc-jcb" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>cc-jcb</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cc-mastercard"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>cc-mastercard</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cc-paypal"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>cc-paypal</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cc-stripe"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>cc-stripe</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cc-visa" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>cc-visa</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-credit-card"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>credit-card</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-credit-card-alt"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>credit-card-alt</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-google-wallet"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>google-wallet</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-paypal" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>paypal</a>
		</div>
	</div>

	<div
		style="margin: 10px 20px; font-size: 18px; font-weight: bold; border-bottom: 1px solid #eee; padding-bottom: 5px">图表</div>
	<div class="row fontawesome-icon-list" style="margin-top: 0px">
		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-area-chart"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>area-chart</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bar-chart"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>bar-chart</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bar-chart-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>bar-chart-o
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-line-chart"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>line-chart</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-pie-chart"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>pie-chart</a>
		</div>
	</div>

	<div
		style="margin: 10px 20px; font-size: 18px; font-weight: bold; border-bottom: 1px solid #eee; padding-bottom: 5px">货币</div>
	<div class="row fontawesome-icon-list" style="margin-top: 0px">
		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bitcoin" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>bitcoin <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-btc" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>btc</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cny" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>cny </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-dollar" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>dollar <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-eur" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>eur</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-euro" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>euro <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-gbp" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>gbp</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-gg" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>gg</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-gg-circle"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>gg-circle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-ils" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>ils</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-inr" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>inr</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-jpy" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>jpy</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-krw" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>krw</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-money" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>money</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-rmb" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>rmb </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-rouble" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>rouble <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-rub" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>rub</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-ruble" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>ruble <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-rupee" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>rupee <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-shekel" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>shekel <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-sheqel" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>sheqel <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-try" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>try</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-turkish-lira"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>turkish-lira
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-usd" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>usd</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-won" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>won </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-yen" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>yen </a>
		</div>
	</div>

	<div
		style="margin: 10px 20px; font-size: 18px; font-weight: bold; border-bottom: 1px solid #eee; padding-bottom: 5px">文本编辑</div>
	<div class="row fontawesome-icon-list" style="margin-top: 0px">
		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-align-center"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>align-center</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-align-justify"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>align-justify</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-align-left"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>align-left</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-align-right"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>align-right</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-bold" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>bold</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-chain" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>chain <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-chain-broken"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>chain-broken</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-clipboard"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>clipboard</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-columns" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>columns</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-copy" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>copy <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-cut" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>cut </a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-dedent" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>dedent <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-eraser" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>eraser</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>file</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-o" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>file-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-text"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-text</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-file-text-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>file-text-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-files-o" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>files-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-floppy-o" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>floppy-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-font" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>font</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-header" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>header</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-indent" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>indent</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-italic" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>italic</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-link" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>link</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-list" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>list</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-list-alt" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>list-alt</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-list-ol" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>list-ol</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-list-ul" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>list-ul</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-outdent" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>outdent</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-paperclip"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>paperclip</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-paragraph"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>paragraph</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-paste" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>paste <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-repeat" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>repeat</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-rotate-left"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>rotate-left
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-rotate-right"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>rotate-right
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-save" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>save <span
				class="text-muted">(alias)</span></a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-scissors" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>scissors</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-strikethrough"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>strikethrough</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-subscript"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>subscript</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-superscript"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>superscript</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-table" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>table</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-text-height"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>text-height</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-text-width"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>text-width</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-th" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>th</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-th-large" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>th-large</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-th-list" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>th-list</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-underline"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>underline</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-undo" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>undo</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-unlink" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>unlink <span
				class="text-muted">(alias)</span></a>
		</div>
	</div>

	<div
		style="margin: 10px 20px; font-size: 18px; font-weight: bold; border-bottom: 1px solid #eee; padding-bottom: 5px">指示方向</div>
	<div class="row fontawesome-icon-list" style="margin-top: 0px">
		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-angle-double-down"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>angle-double-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-angle-double-left"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>angle-double-left</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-angle-double-right"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>angle-double-right</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-angle-double-up"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>angle-double-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-angle-down"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>angle-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-angle-left"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>angle-left</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-angle-right"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>angle-right</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-angle-up" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>angle-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrow-circle-down"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>arrow-circle-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrow-circle-left"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>arrow-circle-left</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrow-circle-o-down"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>arrow-circle-o-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrow-circle-o-left"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>arrow-circle-o-left</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrow-circle-o-right"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>arrow-circle-o-right</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrow-circle-o-up"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>arrow-circle-o-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrow-circle-right"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>arrow-circle-right</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrow-circle-up"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>arrow-circle-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrow-down"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>arrow-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrow-left"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>arrow-left</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrow-right"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>arrow-right</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrow-up" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>arrow-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrows" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>arrows</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrows-alt"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>arrows-alt</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrows-h" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>arrows-h</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrows-v" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>arrows-v</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-caret-down"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>caret-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-caret-left"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>caret-left</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-caret-right"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>caret-right</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-caret-square-o-down"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>caret-square-o-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-caret-square-o-left"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>caret-square-o-left</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-caret-square-o-right"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>caret-square-o-right</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-caret-square-o-up"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>caret-square-o-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-caret-up" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>caret-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-chevron-circle-down"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>chevron-circle-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-chevron-circle-left"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>chevron-circle-left</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-chevron-circle-right"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>chevron-circle-right</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-chevron-circle-up"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>chevron-circle-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-chevron-down"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>chevron-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-chevron-left"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>chevron-left</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-chevron-right"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>chevron-right</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-chevron-up"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>chevron-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-exchange" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>exchange</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-o-down"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-o-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-o-left"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-o-left</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-o-right"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-o-right</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-hand-o-up"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>hand-o-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-long-arrow-down"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>long-arrow-down</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-long-arrow-left"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>long-arrow-left</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-long-arrow-right"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>long-arrow-right</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-long-arrow-up"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>long-arrow-up</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-toggle-down"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>toggle-down
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-toggle-left"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>toggle-left
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-toggle-right"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>toggle-right
				</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-toggle-up"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>toggle-up
				</a>
		</div>
	</div>

	<div
		style="margin: 10px 20px; font-size: 18px; font-weight: bold; border-bottom: 1px solid #eee; padding-bottom: 5px">视频播放</div>
	<div class="row fontawesome-icon-list" style="margin-top: 0px">
		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-arrows-alt"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>arrows-alt</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-backward" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>backward</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-compress" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>compress</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-eject" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>eject</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-expand" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>expand</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-fast-backward"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>fast-backward</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-fast-forward"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>fast-forward</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-forward" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>forward</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-pause" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>pause</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-pause-circle"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>pause-circle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-pause-circle-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>pause-circle-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-play" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>play</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-play-circle"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>play-circle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-play-circle-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>play-circle-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-random" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>random</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-step-backward"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>step-backward</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-step-forward"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>step-forward</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-stop" aria-hidden="true"></i>
				<span class="sr-only">Example of </span>stop</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-stop-circle"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>stop-circle</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-stop-circle-o"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>stop-circle-o</a>
		</div>

		<div class="fa-hover col-md-3 col-sm-4">
			<a class="col-xs-11"><i class="fa fa-youtube-play"
				aria-hidden="true"></i> <span class="sr-only">Example of </span>youtube-play</a>
		</div>
	</div>
	<br>
	<script type="text/javascript">
		$(function() {
			$(".fa-hover").each(function(index, item) {
				$(this).on("click", function() {
					parent.selIconCallBack($(this).find("i").attr("class"));
				})
			});
		})
	</script>
</body>
</html>