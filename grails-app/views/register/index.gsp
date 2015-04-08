<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to 1hRetouch !!!</title>
</head>
<div role="main" class="main">

	<section class="page-top">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="#">Home</a></li>
						<li class="active">Pages</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h1>Create Account</h1>
				</div>
			</div>
		</div>
	</section>

	<div class="container">

		<div class="row">
			<div class="col-md-12">

				<div class="row featured-boxes login">
					<div class="col-sm-6">

						<h2 class="more-spaced">Trust US</h2>

						<blockquote>We guarantee 100% privacy. Your
							information will not be shared</blockquote>
					</div>
					<div class="col-sm-6">
						<div
							class="featured-box featured-box-secundary default info-content">
							<div class="box-content">
								<h4>Register An Account</h4>
								<g:form controller="register" action='register'
									id="registerForm" name='registerForm'>
									<g:if test='${emailSent}'>
										<br />
										<g:message code='spring.security.ui.register.sent' />
									</g:if>
									<g:else>
									<div class="row">
											<div class="form-group">
												<div class="col-md-6">
													<s2ui:textFieldRow name='firstname'
														labelCode='user.firstname.label' bean="${command}"
														labelCodeDefault='Firstname' value="${command.firstname}"
														class="form-control input-lg" required="true"/>
												</div>

												<div class="col-md-6">
													<s2ui:textFieldRow name='lastname'
														labelCode='user.lastname.label' bean="${command}"
														labelCodeDefault='Lastname' value="${command.lastname}"
														class="form-control input-lg" required="true" />

												</div>
											</div>
										</div>
										<div class="row">
											<div class="form-group">
												<div class="col-md-12">
													<s2ui:textFieldRow name='username'
														labelCode='user.username.label' bean="${command}"
														labelCodeDefault='Username' value="${command.username}"
														class="form-control input-lg" required="true"/>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="form-group">
												<div class="col-md-12">
													<s2ui:textFieldRow name='email' bean="${command}"
														value="${command.email}" size='40'
														labelCode='user.email.label'
														labelCodeDefault='E-mail Address'
														class="form-control input-lg" required="true"/>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="form-group">
												<div class="col-md-6">
													<s2ui:passwordFieldRow name='password'
														labelCode='user.password.label' bean="${command}"
														size='40' labelCodeDefault='Password'
														value="${command.password}" class="form-control input-lg" required="true"/>
												</div>

												<div class="col-md-6">
													<s2ui:passwordFieldRow name='password2'
														labelCode='user.password2.label' bean="${command}"
														size='40' labelCodeDefault='Password (again)'
														value="${command.password2}" class="form-control input-lg" required="true"/>

												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<p class="sign-up-info">
													Already a member?
													<g:link controller="login">Log In</g:link>
												</p>
											</div>
                                        <div class="row" style="  margin-top: 6px;">
                                            <div class="col-md-6">
                                                <input type="submit" value="Register"
                                                       class="btn btn-primary pull-right push-bottom"
                                                       data-loading-text="Loading...">
                                            </div>
                                        </div>
									</g:else>
							</div>
							</g:form>
							<script>
								$(document).ready(function() {
									$('#username').focus();
								});
							</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</html>