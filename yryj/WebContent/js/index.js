$(document).ready(function() {
  $(".search").keyup(function () {
    var searchTerm = $(".search").val();
	if(searchTerm!=""){  // 输入框不为空
				var listItem = $('.results tbody').children('tr');
				var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
				
			  $.extend($.expr[':'], {'containsi': function(elem, i, match, array){ // 定义了containsi方法
					return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
				}
			  });
				
			  $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
				$(this).attr('visible','false');
			  });

			  $(".results tbody tr:containsi('" + searchSplit + "')").each(function(e){
				$(this).attr('visible','true');
			  });

			  var jobCount = $('.results tbody tr[visible="true"]').length;
				$('.counter').text(jobCount + ' 项');

			  if(jobCount == '0') {$('.no-result').show();}
				else {$('.no-result').hide();}
	}
	
	else{  // 输入框为空
		$(".results tbody tr").each(function(e){
			$(this).attr('visible','true');
			var jobCount = $('.results tbody th').length;
				$('.counter').text(jobCount + ' 项');

			 if(jobCount == '0') {$('.no-result').show();}
				else {$('.no-result').hide();}
			
			$('.counter').text(jobCount + ' 项');
		  });
	}
});
});

