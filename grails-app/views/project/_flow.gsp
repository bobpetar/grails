<div class="wizard-progress wizard-progress-lg">
    <div class="steps-progress">
        <div class="progress-indicator" style="width: 0%;"></div>
    </div>
    <ul class="wizard-steps">
        <li class="${params.action=='upload'? 'active':''}">
            <a href="javascript:void(0);" data-toggle="tab"><span>1</span>Upload</a>
        </li>
        <li class="${params.action=='instructions'? 'active':''}">
            <a href="${createLink(uri:'/instructions/'+projectInstance?.projectId)}"><span>2</span>Instructions</a>
        </li>
        <li class="${params.action=='service'? 'active':''}">
            <a href="${createLink(uri:'/service/'+projectInstance?.projectId)}"><span>3</span>Order Service</a>
        </li>
        <li class="${params.action=='checkout'? 'active':''}">
            <a href="javascript:void(0);" data-toggle="tab"><span>4</span>Payment</a>
        </li>
        <li class="${params.action=='download'? 'active':''}">
            <a href="javascript:void(0);" data-toggle="tab"><span>5</span>Download</a>
        </li>
    </ul>

</div>
