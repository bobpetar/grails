<!DOCTYPE html>
<html>
<head>
<title>500 - Internal Server Error</title>
<meta name="layout" content="main">
</head>
<body>
	<div role="main" class="main">

		<section class="page-top">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li class="active">500 - Internal Server Error</li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<div class="container">

			<section class="page-not-found">
				<div class="row">
					<div class="col-md-6 col-md-offset-1">
						<div class="page-not-found-main">
							<h2>
								500 <i class="fa fa-file"></i>
							</h2>
							<p>We're sorry, but something went wrong. Please try again!!!</p>

						</div>
					</div>
				</div>
			</section>
            <g:if env="development">
                <g:renderException exception="${exception}" />
            </g:if>

		</div>
	</div>
</body>
</html>
