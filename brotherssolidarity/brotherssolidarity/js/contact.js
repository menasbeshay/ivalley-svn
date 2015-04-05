$(function() {
	//For all form validations
	var validate={
		init:function(){
			var $this=this;
			// validation will be done at focus out event
			$('#name, #messageTxt').focusout(function() { 
				$this.checkEmpty($(this));
			});
			$('#email').focusout(function() {
				$this.checkEmail($(this));
			});
		},
		//To check email is valid
		isEmail:function(email){
				var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
				return pattern.test(email);
		},
		checkEmpty:function($this){
				if (!$this.val())
					$this.addClass('error');
				else
					$this.removeClass('error');
		},
		checkEmail:function($this){
			if (!$this.val() || !this.isEmail($this.val()))
				$this.addClass('error');
			else
				$this.removeClass('error');
		}
	};
	
	validate.init();
	
	function checkCaptcha(){
		if ($('#captcha_input').val() === $('#hidCap').val()){
			$('#captcha_input').removeClass('error');
			$('.errCap').remove();
		}else{
			$('#captcha_input').addClass('error');
			var errtxt = $('#hidCap').attr('data-error');
			$('#captcha_input').after('<b class="errCap">'+errtxt+'</b>');
		}
	}
                                           
	//Ajax submit
	var ajax={
		init:function(){
			$this=this;
			$('#cform').submit(function(e){
				e.preventDefault();
				var action = $(this).attr('action');
				$this.ajaxSubmit($(this),action);
			});
		},
		ajaxSubmit:function($this,action){
			checkCaptcha();
			if ($('#contact .error').size() > 0){ 
				return false;
			}
			if($('#name').val() == ''){
				$('#name').addClass('error');
				return false;
			}else if($('#email').val() == ''){
				$('#email').addClass('error');
				return false;
			}else if($('#messageTxt').val() == ''){
				$('#messageTxt').addClass('error');
				return false;
			}else if($('#captcha_input').val() == ''){
				$('#captcha_input').addClass('error');
				return false;
			}else{
				$("#cform").submit(function(e){
					//e.preventDefault();
					var action = $(this).attr('action');
					$this.ajaxSubmit($(this),action);
				});
			}
			
			$('#reset').after('<img src="images/ajax-loader.gif" class="loader" />').attr('disabled','disabled');
			
			$.post(action, $('#cform').serialize(),
				function(data){
					$('#message').fadeIn();
					$('#cform').fadeOut();
					$('#cform img.loader').fadeOut('slow',function(){$(this).remove()});
					$('#cform #submit').removeAttr('disabled');
					refreshCaptcha();
				});
		}
	};
	ajax.init();
});