<div class="wizard-progress wizard-progress-lg">
    <div class="steps-progress">
        <div class="progress-indicator" style="width: 0%;"></div>
    </div>
    <ul class="wizard-steps">
        <li class="${params.action=='upload'? 'active':''}">
            <a href="#w4-account" data-toggle="tab"><span>1</span>Upload</a>
        </li>
        <li class="${params.action=='instructions'? 'active':''}">
            <a href="#w4-profile" data-toggle="tab"><span>2</span>Instructions</a>
        </li>
        <li class="${params.action=='service'? 'active':''}">
            <a href="#w4-billing" data-toggle="tab"><span>3</span>Order Service</a>
        </li>
        <li class="${params.action=='checkout'? 'active':''}">
            <a href="#w4-confirm" data-toggle="tab"><span>4</span>Payment</a>
        </li>
        <li class="${params.action=='download'? 'active':''}">
            <a href="#w4-confirm" data-toggle="tab"><span>5</span>Download</a>
        </li>
    </ul>

</div>