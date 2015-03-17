<%@ page import="com.retouch.Technique" %>

<div class="container">
    <div class="row show-grid">
        <div class="col-md-3">
            <section>
                <h4 class="page-header text-capitalize">${techniqueInstance.groep} (Group)</h4>

                <div class="row fontawesome-icon-list">
                    <div class="col-md-12 col-sm-12">
                        <img src="${grailsApplication.config.retouch.imageServer}${techniqueInstance.getThumbnailImageName()}"
                             class="img-responsive" alt="">
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

            <div class="form-group">
                <label class="col-md-3 control-label">File Upload</label>

                <div class="col-md-8">
                    <div data-provides="fileupload" class="fileupload fileupload-new">
                        <div class="input-append">
                            <div class="uneditable-input">
                                <i class="fa fa-file fileupload-exists"></i>
                                <span class="fileupload-preview"></span>
                            </div>
                            <span class="btn btn-default btn-file">
                                <span class="fileupload-exists">Change</span>
                                <span class="fileupload-new">Select file</span>
                                <input type="file" name="beforeafterimage" required="required" accept='image/*'>
                            </span>
                            <a data-dismiss="fileupload" class="btn btn-default fileupload-exists" href="#">Remove</a>
                        </div>
                    </div>
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

        </div>
    </div>
</div>
