<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb justify-content-end">
      <li class="breadcrumb-item"><a href="/">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">Member</li>
    </ol>
  </nav>
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-body">
          	<%if(memberDto == null){ %>
            <h5 class="card-title">로그인</h5>
            <form name="f" method="post" action="check_login.jsp">
              <div class="form-group">
                <input type="email" id="email" name="email" class="form-control" placeholder="Your Email *" value="" />
              </div>
              <div class="form-group">
                <input type="password" id="pwd" name="pwd" class="form-control" placeholder="Your Password *" value="" />
              </div>
              
              <div class="form-row d-flex align-items-center">
	              <div class="form-group col-md-8">
	                <img class="form-control" src="" id="img_form_url"/>
	              </div>
	              <div class="form-group col-md-4">
	                <a href="" id="refreshNumber" class="btn btn-info btn-lg btn-block"><i class="fa fa-refresh" aria-hidden="true"></i> REFRESH</a>
	              </div>
              </div>
              <div class="form-group">
              	<input type="text" name="captchaCode" id="captchaCode" class="form-control" placeholder="캡차코드를 입력하세요" value="" />
              </div>
              
              <div class="form-group">
                <input type="submit" id="checkLogin" class="btn btn-primary" value="Login" />
              </div>
              <div class="form-group">
                <a href="" id="forgetPwd" class="ForgetPwd">Forget Password?</a>
              </div>
            </form>
            <script>
            	$(function(){
            		let captchaKey = "";
            		$("#checkLogin").on("click",function(event){
            			event.preventDefault();
            			if($("#email").val()==""){
            				alert('이메일을 입력하세요.');
            				$("#email").focus();
            				return;
            			}
            			if($("#pwd").val()==""){
            				alert('비밀번호를 입력하세요.');
            				$("#pwd").focus();
            				return;
            			}
            			if($("#captchaCode").val()==""){
            				alert('캡차코드를 입력하세요.');
            				$("#captchaCode").focus();
            				return;
            			}
            			$.ajax({
            				type : 'GET',
            				url : 'captcha/getKeyResult.jsp?key='+
            						captchaKey+"&value="+$("#captchaCode").val(),
            				dataType : 'json',
            				success : function(json){
            					console.log(json);//{result: false, responseTime: 5.85}
            					if(json.result === true){
            						f.submit();
            					}else{
            						alert("캡차코드가 잘못 되었습니다.");
            						loadImage();
            					}
            				}
            			});
            		});//end of login event
		        	
            		$("#refreshNumber").on("click",function(e){
            			e.preventDefault();
            			loadImage();
            		});
            		
            		
		        	var loadImage = function (){
		            	$.ajax({
		        			url : 'captcha/getKey.jsp',
		        			type : 'GET',
		        			dataType : 'json',
		        			error : function(){
		        				alert('Error loading JSON');
		        			},
		        			success : function(json){
		        				console.log(json);
		        				captchaKey = json.key;
		        				$.ajax({
		        					type : 'GET',
		        					url : 'captcha/getImage.jsp?key='+captchaKey,
		        					xhrFields : {
		        						responseType : 'blob'
		        					},
		        					success : function(data){
		        						const url = window.URL || window.webketURL;
		        						const src = url.createObjectURL(data);
		        						$("#img_form_url").attr("src",src);
		        					}
		        				});
		        			}//end of success
		        		});//end of outter ajax
	            	}//end of loadImage function
		        	loadImage();
            		
            	});//end of onload event
            	
            </script>
            <%}else{ %>
            	<h5 class="card-title">로그인을 하셨습니다.</h5>
            	
            <%} %>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%@ include file="../inc/footer.jsp"%>