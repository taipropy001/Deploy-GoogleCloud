<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CLOUD COMPUTING 2018 | ADMIN PAGE</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/jasny-bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
	
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <!-- Custom styles for this template -->
    <link href="css/navmenu-reveal.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body style="">
    <div class="navmenu navmenu-default navmenu-fixed-left">
      <a class="navmenu-brand" href="admin-home">ADMIN PAGE</a>
      <ul class="nav navmenu-nav">
        <li><a href="admin-all?type=1">Manage file</a></li>
        <li><a href="admin-all?type=2">Manage lesson</a></li>


        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Edit Webpage<b class="caret"></b></a>
          <ul class="dropdown-menu navmenu-nav">
            <li><a href="admin-webpage?id=1">Homepage</a></li>
            <li><a href="admin-webpage?id=2">About</a></li>
            <li><a href="admin-webpage?id=3">Teacher</a></li>
            <li><a href="admin-webpage?id=4">Student</a></li>
            <li><a href="admin-webpage?id=5">Contact</a></li>
          </ul>
        </li>
                <li><a href="logout"><span class="glyphicon glyphicon-user"></span> <i><u>Logout</u></i></a></li>
      </ul>
    </div>

    <div class="canvas" style="">
      <div class="navbar navbar-default navbar-fixed-top" style="">
        <button type="button" class="navbar-toggle" data-toggle="offcanvas" data-recalc="false" data-target=".navmenu" data-canvas=".canvas">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>

      <div class="container">
        <c:choose>
        	<c:when test="${mode =='MODE_MAIN' }">
				<div class="page-header">
					<h1 class="set-font">WELCOME TO ADMIN PAGE</h1><br><hr>
					
					<img src=" "/>
				</div>
				<p class="lead"></p>
			</c:when>
			<c:when test="${mode =='MODE_VIEW' }">
				<div class="container text-center" id="taskDiv">
					<c:choose>
						<c:when test="${tp == 1}">
							<h1 class="set-font">MANAGE FILE</h1><br><hr>
								<div class="text-right">				
										<a href="admin-new?type=1" style="font-size: 100" title="Upload file">
											<h1><span class="glyphicon glyphicon-cloud-upload"></span> </h1>
										</a>
								</div>
						</c:when>
						<c:otherwise>
							<h1 class="set-font">MANAGE LESSON</h1><br><hr>
								<div class="text-right">				
										<a href="admin-new?type=2" style="font-size: 100" title="Create new lesson">
											<h1><span class="glyphicon glyphicon-book"></span> </h1>
										</a>
								</div>
						</c:otherwise>
					</c:choose>

					<div class="table-responsive">
						<table class="table table-striped table-bodered text-left">
							<thread>
							<tr>
								<th>Id</th>
								<th>Title</th>
								<th>Small picture</th>
								<th>Date Created</th>
								<th></th>
								<th></th>
							</tr>
							</thread>
							<tbody>
								<c:forEach var="view" items="${views}">
									<c:if test="${view.type == tp }">
										<tr>
										<td>${view.idn }</td>
										<td>${view.title }</td>
										<td><img src="${view.image }" width="100" /></td>
										<td>
											<i><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${view.dateCreated }"/></i>
										</td>
										<td><a href="admin-update?id=${view.idn}&type=${view.type}"><span
												class="glyphicon glyphicon-pencil"></span></a></td>
										<td><a href="admin-delete?id=${view.idn}&type=${view.type}"><span
												class="glyphicon glyphicon-trash"></span></a></td>
									</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:when>
	
			<c:when test="${mode=='MODE_NEW'||mode == 'MODE_UPDATE' }">
				<div class="container text-center">
					<c:choose>
						<c:when test="${tp == 2 }">
							<c:if test="${mode=='MODE_NEW'}"><h1 class="set-font">NEW LESSON</h1><br><hr><br></c:if>
							<c:if test="${mode=='MODE_UPDATE'}"><h1 class="set-font">UPDATE LESSON</h1><br><hr><br></c:if>
							<form class="form-horizontal" method="POST" action="admin-save?type=${tp }">
								<input type="hidden" name="idn" value="${view.idn}" />
								<div class="form-group">
									<label class="control-label col-md-2">Title</label>
									<div class="col-md-10">
										<input type="text" name="title" class="form-control"
											value="${view.title}" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">Content</label>
									<div class="col-md-10">
										<textarea type="text" id="content1" name="content" class="form-control"
											>${view.content}</textarea>
										<script type="text/javascript">
											config ={};
											config.entities_latin = false;
											config.toolbarGroups = [
												{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
												{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
												{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
												{ name: 'forms', groups: [ 'forms' ] },
												'/',
												{ name: 'styles', groups: [ 'styles' ] },
												{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
												'/',
												{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
												{ name: 'links', groups: [ 'links' ] },
												{ name: 'insert', groups: [ 'insert' ] },
												{ name: 'colors', groups: [ 'colors' ] },
												{ name: 'tools', groups: [ 'tools' ] },
												{ name: 'others', groups: [ 'others' ] },
												{ name: 'about', groups: [ 'about' ] }
											];

											config.removeButtons = 'Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Source,Save,NewPage,Preview,Print,Templates,Cut,Copy,Paste,PasteText,PasteFromWord,Undo,Redo,Find,Replace,SelectAll,Scayt,Subscript,Superscript,CopyFormatting,RemoveFormat,BidiLtr,BidiRtl,Language,Anchor,Flash,Smiley,PageBreak,ShowBlocks,About';

											CKEDITOR.replace('content1',config);
										</script>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">Small picture link</label>
									<div class="col-md-10">
										<input type="text" name="image" class="form-control"
											value="${view.image}" />
									</div>
								</div>
								<div class="form-group">
									<input type="submit" class="btn btn-primary" value="Save" />
								</div>
							</form>
						</c:when>
						
						<c:otherwise>
							<c:if test="${mode=='MODE_NEW'}"><h1 class="set-font">NEW FILE</h1><br><hr><br></c:if>
							<c:if test="${mode=='MODE_UPDATE'}"><h1 class="set-font">UPDATE FILE</h1><br><hr><br></c:if>
							<form class="form-horizontal" method="POST" action="admin-save?type=${tp }">
								<input type="hidden" name="idn" value="${view.idn}" />
								<div class="form-group">
									<label class="control-label col-md-2">Title</label>
									<div class="col-md-10">
										<input type="text" name="title" class="form-control"
											value="${view.title}" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">File link</label>
									<div class="col-md-10">
										<input type="text" name="content" class="form-control"
											value="${view.content}" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2">Small picture link</label>
									<div class="col-md-10">
										<input type="text" name="image" class="form-control"
											value="${view.image}" />
									</div>
								</div>
								<div class="form-group">
									<input type="submit" class="btn btn-primary" value="Save" />
								</div>
							</form>
						</c:otherwise>
					</c:choose>
					
					<iframe src="/upload" width="100%" height="180" style="border: none;"></iframe>
				</div>
			</c:when>
			
			<c:when test="${mode == 'MODE_CONT' }">
	
				<div class="container">
					<c:if test="${webpage.idw == 1 }"><h1 class="set-font">CHANGE HOMPAGE CONTENT</h1><br><hr><br></c:if>
					<c:if test="${webpage.idw == 2 }"><h1 class="set-font">CHANGE WEBPAGE ABOUT</h1><br><hr><br></c:if>
					<c:if test="${webpage.idw == 3 }"><h1 class="set-font">CHANGE TEACHER INFOMATION</h1><br><hr><br></c:if>
					<c:if test="${webpage.idw == 4 }"><h1 class="set-font">CHANGE STUDENT INFOMATION</h1><br><hr><br></c:if>
					<c:if test="${webpage.idw == 5 }"><h1 class="set-font">CHANGE WEBPAGE CONTACT</h1><br><hr><br></c:if>
					
							
					<div class="col-md-12">
						<form class="form-horizontal" method="POST" action="admin-change?id=${webpage.idw }">
							<input type="hidden" name="idw" value="${webpage.idw}" />
							<textarea type="text" id="content2" name="webcontent" class="form-control">${webpage.webcontent}</textarea>
							<script type="text/javascript">
								config ={};
								config.entities_latin = false;
								config.toolbarGroups = [
									{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
									{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
									{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
									{ name: 'forms', groups: [ 'forms' ] },
									'/',
									{ name: 'styles', groups: [ 'styles' ] },
									{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
									'/',
									{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
									{ name: 'links', groups: [ 'links' ] },
									{ name: 'insert', groups: [ 'insert' ] },
									{ name: 'colors', groups: [ 'colors' ] },
									{ name: 'tools', groups: [ 'tools' ] },
									{ name: 'others', groups: [ 'others' ] },
									{ name: 'about', groups: [ 'about' ] }
								];
	
								config.removeButtons = 'Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Source,Save,NewPage,Preview,Print,Templates,Cut,Copy,Paste,PasteText,PasteFromWord,Undo,Redo,Find,Replace,SelectAll,Scayt,Subscript,Superscript,CopyFormatting,RemoveFormat,BidiLtr,BidiRtl,Language,Anchor,Flash,Smiley,PageBreak,ShowBlocks,About';
	
								CKEDITOR.replace('content2',config);
							</script>
							<hr>
							<center>
							<div class="form-group">
								<input type="submit" class="btn btn-primary" value="SAVE" />
							</div>
							</center>
						</form>
					</div>
				</div>
					
			</c:when>

	        </c:choose>
      
      </div><!-- /.container -->
    </div>
    

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jasny-bootstrap.min.js"></script>
  

</body>
</html>