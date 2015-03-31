<%@ page import="com.retouch.Technique" %>

<div class="container">
    <div class="row show-grid">
        <div class="col-md-3">
            <section>
                <h4 class="page-header text-capitalize">${techniqueInstance.groep} (Group)</h4>

                <div class="row fontawesome-icon-list">
                    <div class="col-md-12 col-sm-12">
                        <g:link class="list" action="show" id="${techniqueInstance.id}">
                            <img src="${grailsApplication.config.retouch.techniqueImageServer}${techniqueInstance.getThumbnailImageName()}"
                                 class="img-responsive" alt=""></g:link>
                    </div>
                </div>
            </section>
        </div>

        <div class="col-md-8">
            <h4 class="page-header text-capitalize">${techniqueInstance.name}</h4>

            <div class="form-group">
                <label class="col-md-3 control-label" for="name">Technique Name</label>

                <div class="col-md-8">
                    <g:textField name="name" class="form-control" required="" value="${techniqueInstance?.name}"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label" for="groep">Group Name</label>

                <div class="col-md-8">
                    <g:textField name="groep" id="groep" class="form-control"
                                 required="" value="${techniqueInstance?.groep}"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label" for="description">Description</label>

                <div class="col-md-8">
                    <g:textArea rows="5" name="description" class="form-control" id="username"
                                required="" value="${techniqueInstance?.description}"/>
                </div>
            </div>

            <g:textField name="beforeafterimage" id="beforeafterimage" class="form-control hidden"
                         required="" value="${techniqueInstance?.beforeafterimage}"/>


            <div class="form-group">
                <label class="col-md-3 control-label">File Upload</label>

                <div class="col-md-8">
                    <input type="file" name="beforeafterfile" accept='image/*'>
                </div>
            </div>



            <div class="panel-footer">
                <div class="row">
                    <div class="col-md-9 col-md-offset-3">
                        <g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        <button type="reset" class="btn btn-default">Reset</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
