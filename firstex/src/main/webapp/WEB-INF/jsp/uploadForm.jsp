<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="css/bootstrap.css" rel="stylesheet">

<html xmlns:th="http://www.thymeleaf.org">
<body>

	<div class="container">
		<div class="row">
			<div class="row">
				<br />
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h3 class="panel-title"></h3>
						<center>UPLOAD FILE TOOL</center>
						</h3>
					</div>

					<div class="panel-body">


						<form class="form-horizontal" method="POST" enctype="multipart/form-data" action="/upload">
							<div class="row">
								<div class="col-md-4">
									<input type="file" name="file"/> 
								</div>
								<div class="col-md-1">
									<input type="submit" value="Upload" />
								</div>
								<div class="col-mid-6"/>
									<input type="text" value="${linktai }" size="60" />
								</div>
							</div>
						</form>
					</div>
					<br />

				</div>
			</div>

		</div>
	</div>

</body>
</html>
