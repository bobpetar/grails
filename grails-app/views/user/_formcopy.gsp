<%@ page import="com.retouch.User"%>


<!-- start: page -->

<div class="row">
	<div class="col-md-4 col-lg-3">

		<section class="panel">
			<header class="panel-heading">
				<div class="panel-actions">
					<a href="#" class="panel-action panel-action-toggle"
						data-panel-toggle></a> <a href="#"
						class="panel-action panel-action-dismiss" data-panel-dismiss></a>
				</div>

				<h2 class="panel-title">Projects</h2>
			</header>
			<div class="panel-body">
				<ul class="simple-post-list">
					<li>
						<div class="post-image">
							<div class="img-thumbnail">
								<a href="#"> <asset:image
										src="admin/images/post-thumb-1.jpg" />
								</a>
							</div>
						</div>
						<div class="post-info">
							<a href="#">Nullam Vitae Nibh Un Odiosters</a>
							<div class="post-meta">Jan 10, 2013</div>
						</div>
					</li>
					<li>
						<div class="post-image">
							<div class="img-thumbnail">
								<a href="#"> <asset:image
										src="admin/images/post-thumb-2.jpg" />
								</a>
							</div>
						</div>
						<div class="post-info">
							<a href="#">Vitae Nibh Un Odiosters</a>
							<div class="post-meta">Jan 10, 2013</div>
						</div>
					</li>
					<li>
						<div class="post-image">
							<div class="img-thumbnail">
								<a href="#"> <asset:image
										src="admin/images/post-thumb-3.jpg" />
								</a>
							</div>
						</div>
						<div class="post-info">
							<a href="#">Odiosters Nullam Vitae</a>
							<div class="post-meta">Jan 10, 2013</div>
						</div>
					</li>
				</ul>
			</div>
		</section>

	</div>
	<div class="col-md-8 col-lg-6">

		<h4 class="mb-xlg">Personal Information</h4>
		<fieldset>
			<div class="form-group">
				<label class="col-md-3 control-label" for="firstname">First
					Name</label>
				<div class="col-md-8">
					<g:textField name="firstname" id="firstname" class="form-control"
						required="" value="${userInstance?.firstname}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="lastname">Last
					Name</label>
				<div class="col-md-8">
					<g:textField name="lastname" id="lastname" class="form-control"
						required="" value="${userInstance?.lastname}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="username">User
					Name</label>
				<div class="col-md-8">
					<g:textField name="username" class="form-control" id="username"
						required="" value="${userInstance?.username}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="email">Email</label>
				<div class="col-md-8">
					<g:field type="email" name="email" class="form-control" id="email"
						required="" value="${userInstance?.email}" />
				</div>
			</div>
		</fieldset>
		<hr class="dotted tall">
		<h4 class="mb-xlg">Access Control</h4>
		<fieldset>
			<div class="form-group">
				<label class="col-xs-5 control-label mt-xs pt-none">Enabled</label>
				<div class="col-md-5">
					<div class="checkbox-custom checkbox-default checkbox-inline mt-xs">
						<g:checkBox name="enabled" id="enabled"
							value="${userInstance?.enabled}" />
						<label for="enabled"></label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-xs-5 control-label mt-xs pt-none">Account
					Expired</label>
				<div class="col-md-5">
					<div class="checkbox-custom checkbox-default checkbox-inline mt-xs">
						<g:checkBox name="accountExpired" id="accountExpired"
							value="${userInstance?.accountExpired}" />
						<label for="accountExpired"></label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-xs-5 control-label mt-xs pt-none">Account
					Locked</label>
				<div class="col-md-5">
					<div class="checkbox-custom checkbox-default checkbox-inline mt-xs">
						<g:checkBox name="accountLocked" id="accountLocked"
							value="${userInstance?.accountLocked}" />
						<label for="accountLocked"></label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-xs-5 control-label mt-xs pt-none">Password
					Expired</label>
				<div class="col-md-5">
					<div class="checkbox-custom checkbox-default checkbox-inline mt-xs">
						<g:checkBox name="passwordExpired" id="passwordExpired"
							value="${userInstance?.passwordExpired}" />
						<label for="passwordExpired"></label>
					</div>
				</div>
			</div>
		</fieldset>
		<hr class="dotted tall">
		<h4 class="mb-xlg">Enter Password</h4>
		<fieldset class="mb-xl">
			<div class="form-group">
				<label class="col-md-3 control-label" for="password">
					Password</label>
				<div class="col-md-8">
					<g:passwordField name="password" id="password" class="form-control"
						required="" value="${userInstance?.password}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" for="profileNewPasswordRepeat">Repeat
					Password</label>
				<div class="col-md-8">
					<g:passwordField name="password2" id="password2" class="form-control"
						required="" value="${userInstance?.password}" />
				</div>
			</div>

			<div class="panel-footer">
				<div class="row">
					<div class="col-md-9 col-md-offset-3">
						<button type="submit" class="btn btn-primary">Submit</button>
						<button type="reset" class="btn btn-default">Reset</button>
					</div>
				</div>
			</div>
		</fieldset>
	</div>
	<div class="col-md-12 col-lg-3">

		<h4 class="mb-md">Projects</h4>
		<ul class="simple-bullet-list mb-xlg">
			<li class="red"><span class="title">Porto Template</span> <span
				class="description truncate">Lorem ipsom dolor sit.</span></li>
			<li class="green"><span class="title">Tucson HTML5
					Template</span> <span class="description truncate">Lorem ipsom
					dolor sit amet</span></li>
			<li class="blue"><span class="title">Porto HTML5 Template</span>
				<span class="description truncate">Lorem ipsom dolor sit.</span></li>
			<li class="orange"><span class="title">Tucson Template</span> <span
				class="description truncate">Lorem ipsom dolor sit.</span></li>
		</ul>
	</div>

</div>
