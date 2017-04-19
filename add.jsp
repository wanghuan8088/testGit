<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/page/head.jsp"%>

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu">
        <li class="header">导航</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active"><a href="/woo-web/page/starter.jsp"><i class="fa fa-edit"></i> <span>商城管理</span></a></li>
        <li><a href="/woo-web/page/product/list.jsp"><i class="fa fa-circle-o"></i> <span>商品管理</span></a></li>
        <li><a href="/woo-web/page/order/list.jsp"><i class="fa fa-th"></i> <span>订单管理</span></a></li>
        <li><a href="/woo-web/page/topic/list.jsp"><i class="fa fa-dashboard"></i> <span>社区管理</span></a></li>
        <li><a href="/woo-web/page/user/list.jsp"><i class="fa fa-laptop"></i> <span>用户管理</span></a></li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>
  
<style>
table.dataTable.display tbody tr.selected {
    background-color: #acbad4;
}
</style>

<!-- 模态框（Modal） -->
<div  class="modal fade"  id="myModal" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width:1000px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					
				</h4>
			</div>
			<div class="modal-body">
				
				
<!-- Main content -->
    <section class="content" style="width:800px;">
    
    
      <div class="form-group">
       <label>选择</label>
          <select class="form-control" id="productType" onchange="showMsg(this)">
			            <option value="1">男用宝贝</option>
			            <option value="2">情趣内衣</option>
			            <option value="3">调情助兴</option>
			            <option value="4">女性助手</option>
			            <option value="5">两性乐园</option>
			            <option value="6">套套天地</option>
			            <option value="7">高端产品</option>
			            <option value="8">精品特卖</option>
          </select>
      </div>
    
      <div class="row">
        <div class="col-xs-12">

          <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
            
              <table id="tableobject" class="table table-bordered table-striped display" cellspacing="0" width="100%">
                <thead>
                <tr>
                  <th>商品名称</th>
                  <th>价格</th>
                  <th>创建时间</th>
                </tr>
                </thead>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
				
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick='confirmData(this);' >
					确定
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>




  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
              商城文章
        <small>新 增</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 商城管理</a></li>
        <li class="active">新 增</li>
      </ol>
    </section>



<!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">

          <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
            
<div class="box box-success">
           
           
           
 <div class="box-header with-border">
              <h3 class="box-title">第一步:上传商城首要图片(1)</h3>
            </div>
            
            <div id="imgdivpri" class="row">
            <div id="imgpri">
				<div class="col-md-2 form-group">
	                  <label for="exampleInputFile">商城首要图片(建议上传750*380比例)</label><br>
		              <form id="imageform" method="post" enctype="multipart/form-data">
						  <input id="imageform_key" name="key" type="hidden">
						  <input name="x:52woo" type="hidden" value="52woo">
						  <input id="token" name="token" type="hidden" value="">
						  <input id="imageform_file" name="file" type="file" />
						  <input name="accept" type="hidden" />
					  </form>
					 	<div class="box-footer">
	                		<button type="button" class="btn btn-primary" onClick="uploadFile(this);">上传</button>
	              		</div>
	            </div>
	            <div class="col-md-4">
	            	  <a href="" data-lightbox="example-1" id="orginimage">
							<img id="formimage" src="" width="250" height="250" alt="750*380" /> 
	              	  </a>
	                  <p class="help-block" id="imgname"></p>
	                  <p class="help-block" id="imgtype"></p>
	                  <p class="help-block" id="imgsize"></p>
	            </div>
            </div>
            </div>


            <div class="box-header with-border">
              <h3 class="box-title">第二步:上传商城图片</h3>
            </div>

            <div id="imgdivpre" class="row">
	            <div id="imgdiv" style="display:none;" class="col-md-12" >
					<div class="col-md-2 form-group">
		                  <label for="exampleInputFile">商城内容图片</label><br>
			              <form id="imageform" method="post" enctype="multipart/form-data">
							  <input id="imageform_key" name="key" type="hidden">
							  <input name="x:52woo" type="hidden" value="52woo">
							  <input id="token" name="token" type="hidden" value="">
							  <input id="imageform_file" name="file" type="file" />
							  <input name="accept" type="hidden" />
						  </form>
						 	<div class="box-footer">
		                		<button type="button" class="btn btn-primary" onClick="uploadFile(this);">上传</button>
		              		</div>
		            </div>
		            <div class="col-md-2" form-group>
		            	  <a href="" data-lightbox="example-1" id="orginimage">
								<img id="formimage" src="" width="250" height="250" alt="750*380" /> 
		              	  </a>
		            </div>
		            <div class="col-md-4" form-group>
		                  <p class="help-block" id="imgname"></p>
		                  <p class="help-block" id="imgtype"></p>
		                  <p class="help-block" id="imgsize"></p>
		                  <button type='button' class='btn btn-block btn-primary btn-flat' data-toggle='modal' data-target='#myModal' onclick='transferData(this);'>选择商品</button>
		                  <p class="help-block" id="productName"></p>
		                  <p class="help-block" id="productId" style="display:none;"></p>
		            </div>
		            <div class="col-md-4" form-group>
		                  <img src="/woo-web/page/dist/img/cancelImage.png" style="cursor:pointer" width="100" height="100" alt="删除" onclick="delDiv(this);" /> 
		            </div>
	            </div>
            </div>
            <img src="/woo-web/page/dist/img/upload.png" style="cursor:pointer" onclick="copyDiv();" /> 
 </div>
            
<div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">第三步:填写内容</h3>
            </div>

 				<form role="form">
                <!-- text input -->
                <div class="form-group">
                  <label>标题</label>
                  <input type="text" id="titlef" class="form-control" placeholder="请输入 ...">
                </div>
                <div class="form-group">
                  <label>副标题</label>
                  <input type="text" id="subtitlef" class="form-control" placeholder="请输入 ...">
                </div>

                <!-- textarea -->
                <div class="form-group">
                  <label>内容</label>
                  <textarea class="form-control" id="contentf" rows="15" placeholder="请输入 ..."></textarea>
                </div>

              <div class="box-footer">
                <button type="button" class="btn btn-primary" onClick="submitForm();">提交</button>
              </div>
              </form>

</div>
              
              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->




  </div>
  <!-- /.content-wrapper -->

<%@ include file="/page/foot.jsp"%>


<script>

var getImgName = function (){
    var array = "ABCDEFGHIJKMNPQRSTUVWXYZ".split ("");
    var str = "";

    var reg = /^\d$/;
    var now = new Date;
    var m = now.getMonth () + 1;
    var d = now.getDate();
    var hour = now.getHours();
    var minute = now.getMinutes();
    m = reg.test(m) ? "0" + m : m;
    d = reg.test(d) ? "0" + d : d;
    hour = reg.test(hour) ? "0" + hour : hour;
    minute = reg.test(minute) ? "0" + minute : minute;
    str += now.getFullYear().toString() + m.toString() + d.toString() + hour.toString() + minute.toString();
    for ( var i = 0; i < 6; i++)
    {
        str += array[Math.floor (Math.random () * array.length)];
    }
    return str;
};
 
function copyDiv(){ 
	var imgdiv = $('body').contents().find('#imgdiv');
	var imgdivCopy = imgdiv.clone(true);
	imgdivCopy.attr('id',"imgdivcopy");
	imgdivCopy.attr('style',"display:block;");
	$('#imgdivpre').append(imgdivCopy);
}
function delDiv(object){ 
	$(object).parent().parent().remove();
}

function uploadFile(object) {
	var imgdiv = $(object).parent().parent().parent();
	imgdiv.find("#formimage").attr('src',"/woo-web/page/giphy.gif");
	

//$("#formimage"+item).attr('src',"/woo-web/page/giphy.gif");
var files = imgdiv.find("#imageform_file").prop('files');

//var files = $('#imageform'+item+'_file').prop('files');
var filename = getImgName();//files[0].name;
var filetype = files[0].type;
var filesize = files[0].size;

imgdiv.find("#imageform_key").val(filename);
//$("#imageform_key").val(filename);

$.ajax({
    type : "get",  
    url : "/woo-api/qiniu/getUpToken",
    async : false,  
    success : function(result) {
        //$("#token"+item).val(result.data); 
        imgdiv.find("#token").val(result.data);
    }  
});  

var formData = new FormData(imgdiv.find("#imageform")[0]);
//var formData = new FormData($( "#imageform"+item )[0]);

$.ajax({
     url: 'http://upload.qiniu.com' ,  
     type: 'POST',  
     data: formData,  
     async: true,  
     cache: false,  
     contentType: false,  
     processData: false,  
     success: function (responseStr) {
         imgdiv.find("#formimage").attr('src',"http://7xwpgg.com1.z0.glb.clouddn.com/" + responseStr.key);
         imgdiv.find("#orginimage").attr('href',"http://7xwpgg.com1.z0.glb.clouddn.com/" + responseStr.key);
         imgdiv.find("#imgname").text("地址:  http://7xwpgg.com1.z0.glb.clouddn.com/" + responseStr.key); 
         imgdiv.find("#imgtype").text("类型:  " + filetype); 
         imgdiv.find("#imgsize").text("大小:  " + filesize + " bytes"); 
         
     },  
     error: function (responseStr) {
    	 alert("error:" + JSON.stringify(responseStr));
     }
});  

}

function submitForm() {
	var dataf=new Object();
	dataf.title=$("#titlef").val();
	dataf.authorId = <%=userId%>;
	dataf.subtitle=$("#subtitlef").val(); 
	dataf.content=$("#contentf").val(); 
	// 商城首要图片
	dataf.primaryImage=$("#imgpri").find("#formimage").attr('src');
	// 商城图片
	var arrayf=new Array()
	$('div[id="imgdivcopy"]').each(function(index){
		var aricleMedia=new Object();
		var image = $(this).find("#formimage").attr('src');
		if (image==null || image=='') {
			return true;
		}
		var productId = $(this).find("#productId").text();
		
		aricleMedia.url=image;
		if (productId != "" ) {
			   aricleMedia.productId=productId;
		}
		aricleMedia.sort=index+1;
		
		arrayf[index]=aricleMedia;
	});
	dataf.aricleMediaList=arrayf;
	
	var datafstr=JSON.stringify(dataf);
	var requestData = datafstr;
	
	$.ajax({
	    url: '/woo-api/article/save',
	    type: 'POST',  
	    data: "para="+encodeURIComponent(requestData),  
	    async: true,  
	    cache: false,  
	    contentType: 'application/x-www-form-urlencoded',
	    processData: false,  
	    success: function (responseStr) {
	    	ShowSuccess("保存成功!");
	    },  
	    error: function (responseStr) {
	   	 alert("error:" + JSON.stringify(responseStr));
	    }
	});
	
	
}


</script>


<script>
var requestData = "{\"category\":1}";

$(document).ready(function() {
	
    $('#tableobject').DataTable( {
    	
    	"oLanguage": {
    		"sLengthMenu": "每页显示 _MENU_ 条记录",
    		"sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
    		"sInfoEmpty": "没有数据",
    		"sInfoFiltered": "(从 _MAX_ 条数据中检索)",
    		"oPaginate": {
    		"sFirst": "首页",
    		"sPrevious": "前一页",
    		"sNext": "后一页",
    		"sLast": "尾页"
    		},
    		"sZeroRecords": "没有检索到数据",
    		"sProcessing":   "加载中...",
    		"sLoadingRecords": "加载中..."
    		},
    
    	"searching":false,
        "aoColumnDefs": [
                         { "sWidth": "25%", "aTargets": [ 0 ] },
                         { "sWidth": "10%", "aTargets": [ 1 ] },
                         { "sWidth": "15%", "aTargets": [ 2 ] }
                       ],
                       
    	"ajax": {
            "url": "/woo-api/product/productByCategory",
            "type": "POST",
            "dataSrc": function ( json ) {
                return json.data.product;
              },
             "data": function ( d ) {
                d.para = requestData;
            }
        },
        "columns":[
                   { "data": "name" },
                   { "data": "price" },
                   { "data": "createTime" }
               ]
        
    } );
    
    var table = $('#tableobject').DataTable();
    $('#tableobject tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    } );
 
} );

var productButton;

function transferData(object) {
	productButton = object;
 }
 
function confirmData(object) {
	var imgdiv = $(productButton).parent();
	var table = $('#tableobject').DataTable();
    imgdiv.find("#productName").text(table.row('.selected').data().name);
    imgdiv.find("#productId").text(table.row('.selected').data().id);
	$('#myModal').modal('hide')
 }

function showMsg(obj) {
    var opt = obj.options[obj.selectedIndex]
    requestData = "{\"category\":" + opt.value + "}";
    $('#tableobject').DataTable().clear().draw().ajax.reload();
 }
 
</script>

</html>
