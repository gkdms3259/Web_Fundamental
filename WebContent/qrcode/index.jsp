<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/clipboard@2/dist/clipboard.min.js"></script>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Shorten URL</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Shorten URL Generator</h5>
						<form>
			              <div class="form-group">
			                <input type="text" id="url" name="url" class="form-control" placeholder="Your URL *" value="http://" />
			              </div>
			              
			              <div class="form-row d-flex align-items-center">
				              <div class="form-group col-md-8">
				                <p id="shortenUrl">shorten url</p> 
				              </div>
				              <div class="form-group col-md-4">
				                <button id="clip_copy"  data-clipboard-target="#shortenUrl"  class="btn btn-info btn-lg btn-block"><i class="fa fa-clipboard" aria-hidden="true"></i>  Copy to clipboard</button>
				              </div>
			              </div>
			             
			              <div class="form-group">
			               	<a href="" id="refreshNumber" class="btn btn-info btn-lg btn-block"><i class="fa fa-refresh" aria-hidden="true"></i> GENERATOR</a>
			              </div>
			            </form>
			            <script>
			            	$(function(){
			            		$('#refreshNumber').on("click",function(e){
			            			e.preventDefault();
			            			if($("#url").val()==""){
			            				alert("url를 입력하세요.");
			            				$("#url").focus();
			            				return;
			            			}
			            			
			            			$.ajax({
			            				type : 'GET',
			            				url : 'createShortenUrl.jsp?url='+$("#url").val(),
			            				dataType : 'json',
			            				success : function(json){
			            					console.log(json);
			            					let shortUrl = json.path;
			            					if(shortUrl){
			            						$("#shortenUrl").html(shortUrl);
			            					}else{
			            						$("#shortenUrl").html('shorten url을 생성하지 못했습니다.');
			            					}
			            				}
			            			});
			            		});
			            		
			            		$("#clip_copy").on("click",function(e){
			            			e.preventDefault();
			            			var clipboard = new ClipboardJS('#clip_copy');

				            		clipboard.on('success', function(e) {
				            		    console.info('Action:', e.action);
				            		    console.info('Text:', e.text);
				            		    console.info('Trigger:', e.trigger);

				            		    e.clearSelection();
				            		    
				            		});
			            		});
			            		
			            		
			            		
			            	});
			            </script>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="../inc/footer.jsp"%>