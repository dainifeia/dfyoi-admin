function openIframe(url, obj) {
	$(".treeview li").removeClass("active");
	$(obj).parent().addClass("active");
	$("#iframeCenter").attr("src", url);
}
(function($) {
	$.fn.sidebarMenu = function(options) {
		options = $.extend({}, $.fn.sidebarMenu.defaults, options || {});
		var target = $(this);
		var level = 0;
		if (options.data) {
			target.append("<li class=\"header\">我的工作台</li>");
			init(target, options.data);
		}
		function init(target, data) {
			$.each(data,function(i, item) {
								if (item.children && item.children.length > 0) {
									// 有子节点
									var li = $("<li class=\"treeview\"></li>");
									var a = $("<a style=\"cursor:pointer\"  href=\"#\"></a>")

									var icon = $("<i class=\"fa fa-file-o\"></i>");
									if (item.icon != null && item.icon != "") {
										icon.attr("class", item.icon);
									}
									var title = $("<span>" + item.text
											+ "</span>");
									var acc = $("<span class=\"pull-right-container\"><i class=\"fa fa-angle-left pull-right\"></i></span>");

									a.append(icon);
									a.append(title);
									a.append(acc);

									li.append(a);
									target.append(li);
									var cul = $("<ul class=\"treeview-menu\">");
									li.append(cul);
									init(cul, item.children);
								} else {
									// 没有子节点
									var li = $("<li></li>");
									var a = "";
									var icon = "fa fa-file-o";
									if (item.icon != null && item.icon != "") {
										icon = item.icon;
									}
									if (item.targetType === "blank") {
										a = $("<a style=\"cursor:pointer\" href=\""
												+ item.url
												+ "\" target=\"_blank\"><i class=\""
												+ icon + "\"></i>" + item.text
												+ "</a>");
									} else if (item.targetType === "iframe-tab") {
										a = $("<a style=\"cursor:pointer\" onclick=\"openIframe('"
												+ item.url
												+ "',this)\"><i class=\""
												+ icon + "\"></i>" + item.text
												+ "</a>");
									}
									li.append(a);
									target.append(li);
								}
							})
		}
		/*
		 * function init(target, data,level) { target.append("<li class=\"header\">我的工作台</li>");
		 * $.each(data, function (i, item) { if (item.children &&
		 * item.children.length > 0) { //有子节点 target.append(); }else{ //没有子节点 }
		 * 
		 * 
		 * var li = $('<li class="treeview " data-level="' + level + '"></li>');
		 * var a; if (level > 0) { a = $('<a style="padding-left:' + (level *
		 * 20) + 'px"></a>'); } else { a = $('<a></a>'); }
		 * 
		 * var icon = $('<i></i>');
		 * 
		 * icon.addClass(item.icon); var isOpen = item.isOpen;
		 * 
		 * var text = $(' <span class="title"></span>');
		 * text.addClass('menu-text').text(item.text); a.append(icon);
		 * a.append(text); a.addClass("nav-link"); if (isOpen === true) {
		 * li.addClass("active"); } if (item.children && item.children.length >
		 * 0) { var pullSpan = $('<span class="pull-right-container"></span>');
		 * var pullIcon = $('<i class="fa fa-angle-left pull-right"></i>');
		 * pullSpan.append(pullIcon); a.append(pullSpan); li.append(a);
		 * 
		 * var menus = $('<ul></ul>'); menus.addClass('treeview-menu'); if
		 * (isOpen===true) { menus.css("display", "block");
		 * menus.addClass("menu-open"); } else { menus.css("display", "none"); }
		 * init(menus, item.children,level+1); li.append(menus); } else { if
		 * (item.targetType != null && item.targetType === "blank") //代表打开新页面 {
		 * $(li).removeClass("treeview"); a.attr("href", item.url);
		 * a.attr("target", "_blank"); } else if (item.targetType != null &&
		 * item.targetType === "iframe-tab") { a.attr('onclick',
		 * "openIframe('"+item.url+"')"); } a.addClass("nav-link"); var badge =
		 * $("<span></span>"); if (item.tip != null && item.tip > 0) {
		 * badge.addClass("label").addClass("label-success").text(item.tip); }
		 * a.append(badge); li.append(a); } target.append(li); }); }
		 */

	}

	$.fn.sidebarMenu.defaults = {
		url : null,
		param : null,
		data : null
	};
})(jQuery);
// //////////////////////////////////////////////////////////////////////////////////////////////////////
// //////////////////////////////////////JQgrid开始////////////////////////////////////////////////////////////
$(window).resize(function() {
	$(".jqgrid").each(function() {
		var w = $(this).parents(".ui-jqgrid").parent().width();
		$(this).jqGrid('setGridWidth', w);
	})
});
// JqGrid TreeGrid 展开方法
var treeExpand = function(xhr) {
	setTimeout(function() {
		var data = $(".jqgrid").jqGrid("getGridParam").data;
		var obj = false;
		var exid = $(".jqgrid").attr("data-exid");
		if (exid == undefined || exid == null || exid == 0) {
			return;
		} else {
			var rowData = $(".jqgrid").jqGrid('getRowData', exid);
			var rlft = rowData.lft;
			var rrgt = rowData.rgt;
			for (var i = 0; i < data.length; i++) {
				var lft = data[i].lft;
				var rgt = data[i].rgt;
				if ((lft < rlft && rgt > rrgt) || ((lft == rlft && rgt == rrgt)&& $("#"+exid).find(".glyphicon-unchecked").length<=0)) {
					$(".jqgrid").jqGrid("expandRow", data[i]);
					$(".jqgrid").jqGrid("expandNode", data[i]);

				}
			}
		}
	}, 100);
};
// /////////////////////////////////////表单验证开始///////////////////////////////////////////////////////////

/**
 * 判断整数num是否等于0
 * 
 * @param num
 * @return
 * @author jiqinlin
 */
function isIntEqZero(num) {
	return num == 0;
}

/**
 * 判断整数num是否大于0
 * 
 * @param num
 * @return
 * @author jiqinlin
 */
function isIntGtZero(num) {
	return num > 0;
}

/**
 * 判断整数num是否大于或等于0
 * 
 * @param num
 * @return
 * @author jiqinlin
 */
function isIntGteZero(num) {
	return num >= 0;
}

/**
 * 判断浮点数num是否等于0
 * 
 * @param num
 *            浮点数
 * @return
 * @author jiqinlin
 */
function isFloatEqZero(num) {
	return num == 0;
}

/**
 * 判断浮点数num是否大于0
 * 
 * @param num
 *            浮点数
 * @return
 * @author jiqinlin
 */
function isFloatGtZero(num) {
	return num > 0;
}

/**
 * 判断浮点数num是否大于或等于0
 * 
 * @param num
 *            浮点数
 * @return
 * @author jiqinlin
 */
function isFloatGteZero(num) {
	return num >= 0;
}

/**
 * 匹配Email地址
 */
function isEmail(str) {
	if (str == null || str == "")
		return false;
	var result = str.match(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 判断数值类型，包括整数和浮点数
 */
function isNumber(str) {
	if (isDouble(str) || isInteger(str))
		return true;
	return false;
}

/**
 * 只能输入数字[0-9]
 */
function isDigits(str) {
	if (str == null || str == "")
		return false;
	var result = str.match(/^\d+$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 匹配money
 */
function isMoney(str) {
	if (str == null || str == "")
		return false;
	var result = str.match(/^(([1-9]\d*)|(([0-9]{1}|[1-9]+)\.[0-9]{1,2}))$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 匹配phone
 */
function isPhone(str) {
	if (str == null || str == "")
		return false;
	var result = str
			.match(/^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 匹配mobile
 */
function isMobile(str) {
	if (str == null || str == "")
		return false;
	var result = str
			.match(/^((\(\d{2,3}\))|(\d{3}\-))?((13\d{9})|(15\d{9})|(18\d{9}))$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 联系电话(手机/电话皆可)验证
 */
function isTel(text) {
	if (isMobile(text) || isPhone(text))
		return true;
	return false;
}

/**
 * 匹配qq
 */
function isQq(str) {
	if (str == null || str == "")
		return false;
	var result = str.match(/^[1-9]\d{4,12}$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 匹配english
 */
function isEnglish(str) {
	if (str == null || str == "")
		return false;
	var result = str.match(/^[A-Za-z]+$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 匹配integer
 */
function isInteger(str) {
	if (str == null || str == "")
		return false;
	var result = str.match(/^[-\+]?\d+$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 匹配double或float
 */
function isDouble(str) {
	if (str == null || str == "")
		return false;
	var result = str.match(/^[-\+]?\d+(\.\d+)?$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 匹配邮政编码
 */
function isZipCode(str) {
	if (str == null || str == "")
		return false;
	var result = str.match(/^[0-9]{6}$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 匹配URL
 */
function isUrl(str) {
	if (str == null || str == "")
		return false;
	var result = str
			.match(/^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\’:+!]*([^<>\"])*$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 匹配密码，以字母开头，长度在6-12之间，只能包含字符、数字和下划线。
 */
function isPwd(str) {
	if (str == null || str == "")
		return false;
	var result = str.match(/^(\w){6,20}$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 大写字母和下划线4-30
 */
function isSym(str) {
	if (str == null || str == "")
		return false;
	var result = str.match(/^[A-Z|_]{4,30}$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 判断是否为合法字符(a-zA-Z0-9-_)
 */
function isRightfulString(str) {
	if (str == null || str == "")
		return false;
	var result = str.match(/^[A-Za-z0-9_-]+$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 匹配english
 */
function isEnglish(str) {
	if (str == null || str == "")
		return false;
	var result = str.match(/^[A-Za-z]+$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 匹配身份证号码
 */
function isIdCardNo(scCard) {
	if (scCard.length != 0) {
		if (!checkCard(scCard)) {
			return false;
		} else {
			return true;
		}
	}
	return false;
}

/**
 * 匹配汉字
 */
function isChinese(str) {
	if (str == null || str == "")
		return false;
	var result = str.match(/^[\u4e00-\u9fa5]+$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 匹配中文(包括汉字和字符)
 */
function isChineseChar(str) {
	if (str == null || str == "")
		return false;
	var result = str.match(/^[\u0391-\uFFE5]+$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 字符验证，只能包含中文、英文、数字、下划线等字符。
 */
function stringCheck(str) {
	if (str == null || str == "")
		return false;
	var result = str.match(/^[a-zA-Z0-9\u4e00-\u9fa5-_]+$/);
	if (result == null)
		return false;
	return true;
}

/**
 * 过滤中英文特殊字符，除英文"-_"字符外
 */
function stringFilter(str) {
	var pattern = new RegExp(
			"[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]");
	var rs = "";
	for (var i = 0; i < str.length; i++) {
		rs = rs + str.substr(i, 1).replace(pattern, '');
	}
	return rs;
}

/**
 * 判断是否包含中英文特殊字符，除英文"-_"字符外
 */
function isContainsSpecialChar(str) {
	if (str == null || str == "")
		return false;
	var reg = RegExp(/[(\ )(\`)(\~)(\!)(\@)(\#)(\$)(\%)(\^)(\&)(\*)(\()(\))(\+)(\=)(\|)(\{)(\})(\')(\:)(\;)(\')(',)(\[)(\])(\.)(\<)(\>)(\/)(\?)(\~)(\！)(\@)(\#)(\￥)(\%)(\…)(\&)(\*)(\（)(\）)(\—)(\+)(\|)(\{)(\})(\【)(\】)(\‘)(\；)(\：)(\”)(\“)(\’)(\。)(\，)(\、)(\？)]+/);
	return reg.test(str);
}
var vcity = {
	11 : "北京",
	12 : "天津",
	13 : "河北",
	14 : "山西",
	15 : "内蒙古",
	21 : "辽宁",
	22 : "吉林",
	23 : "黑龙江",
	31 : "上海",
	32 : "江苏",
	33 : "浙江",
	34 : "安徽",
	35 : "福建",
	36 : "江西",
	37 : "山东",
	41 : "河南",
	42 : "湖北",
	43 : "湖南",
	44 : "广东",
	45 : "广西",
	46 : "海南",
	50 : "重庆",
	51 : "四川",
	52 : "贵州",
	53 : "云南",
	54 : "西藏",
	61 : "陕西",
	62 : "甘肃",
	63 : "青海",
	64 : "宁夏",
	65 : "新疆",
	71 : "台湾",
	81 : "香港",
	82 : "澳门",
	91 : "国外"
};
checkCard = function(obj) {
	// 校验长度，类型
	if (isCardNo(obj) === false) {
		return false;
	}
	// 检查省份
	if (checkProvince(obj) === false) {
		return false;
	}
	// 校验生日
	if (checkBirthday(obj) === false) {
		return false;
	}
	// 检验位的检测
	if (checkParity(obj) === false) {
		return false;
	}
	return true;
};
// 检查号码是否符合规范，包括长度，类型
isCardNo = function(obj) {
	// 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
	var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
	if (reg.test(obj) === false) {
		return false;
	}
	return true;
};
// 取身份证前两位,校验省份
checkProvince = function(obj) {
	var province = obj.substr(0, 2);
	if (vcity[province] == undefined) {
		return false;
	}
	return true;
};
// 检查生日是否正确
checkBirthday = function(obj) {
	var len = obj.length;
	// 身份证15位时，次序为省（3位）市（3位）年（2位）月（2位）日（2位）校验位（3位），皆为数字
	if (len == '15') {
		var re_fifteen = /^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/;
		var arr_data = obj.match(re_fifteen);
		var year = arr_data[2];
		var month = arr_data[3];
		var day = arr_data[4];
		var birthday = new Date('19' + year + '/' + month + '/' + day);
		return verifyBirthday('19' + year, month, day, birthday);
	}
	// 身份证18位时，次序为省（3位）市（3位）年（4位）月（2位）日（2位）校验位（4位），校验位末尾可能为X
	if (len == '18') {
		var re_eighteen = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/;
		var arr_data = obj.match(re_eighteen);
		var year = arr_data[2];
		var month = arr_data[3];
		var day = arr_data[4];
		var birthday = new Date(year + '/' + month + '/' + day);
		return verifyBirthday(year, month, day, birthday);
	}
	return false;
};
// 校验日期
verifyBirthday = function(year, month, day, birthday) {
	var now = new Date();
	var now_year = now.getFullYear();
	// 年月日是否合理
	if (birthday.getFullYear() == year && (birthday.getMonth() + 1) == month
			&& birthday.getDate() == day) {
		// 判断年份的范围（3岁到100岁之间)
		var time = now_year - year;
		if (time >= 0 && time <= 130) {
			return true;
		}
		return false;
	}
	return false;
};
// 校验位的检测
checkParity = function(obj) {
	// 15位转18位
	obj = changeFivteenToEighteen(obj);
	var len = obj.length;
	if (len == '18') {
		var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8,
				4, 2);
		var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3',
				'2');
		var cardTemp = 0, i, valnum;
		for (i = 0; i < 17; i++) {
			cardTemp += obj.substr(i, 1) * arrInt[i];
		}
		valnum = arrCh[cardTemp % 11];
		if (valnum == obj.substr(17, 1)) {
			return true;
		}
		return false;
	}
	return false;
};
// 15位转18位身份证号
changeFivteenToEighteen = function(obj) {
	if (obj.length == '15') {
		var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8,
				4, 2);
		var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3',
				'2');
		var cardTemp = 0, i;
		obj = obj.substr(0, 6) + '19' + obj.substr(6, obj.length - 6);
		for (i = 0; i < 17; i++) {
			cardTemp += obj.substr(i, 1) * arrInt[i];
		}
		obj += arrCh[cardTemp % 11];
		return obj;
	}
	return obj;
};