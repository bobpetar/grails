<%@ page import="com.retouch.Technique" %>

<div class="container">
    <div class="row show-grid">
        <div class="col-md-3">
            <section>

                <div class="row fontawesome-icon-list">
                    <div class="col-md-12 col-sm-12">
                        Group name example (Eyes, Skin).
                    </div>
                </div>
            </section>
        </div>

        <div class="col-md-8">
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
                <label class="col-md-3 control-label" for="name">Rate Technique</label>

                <div class="col-md-8">
                    <g:textField name="ratePerTechnique" class="form-control" required="" value="0.5"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label" for="description">Description</label>

                <div class="col-md-8">
                    <g:textArea rows="5" name="description" class="form-control" id="username"
                                required="" value="${techniqueInstance?.description}"/>
                </div>
            </div>

            <input name="isDeleted" id="isDeleted" type="hidden" value="${techniqueInstance?.isDeleted}" />

            <div class="form-group">
                <label class="col-md-3 control-label">File Upload</label>

                <div class="col-md-8">
                    <input type="file" required="true" name="beforeafterimage" accept='image/*'>
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
