<div>
    <ul class="simple-user-list mb-xlg no-list-stype" style="padding-left: 0px;">
        <g:each in="${messages}" var="message">

            <li class="panel panel-featured-left panel-featured-primary">
                <div class="feature-box secundary">
                    <div class="feature-box-icon">
                        <g:if test="${message.role=='RETOUCHER'}">
                            <i class=" secondaryColor fa fa-paint-brush"></i>
                        </g:if>
                        <g:else>
                            <i class=" secondaryColor fa fa-user"></i>
                        </g:else>
                    </div>
                    <div class="timestamp"> <prettytime:display date="${message.createdOn}"/></div>
                    <div class="feature-box-info">
                        <g:if test="${message.user == currentUser}">
                            <h4 class="shorter">You</h4>
                        </g:if>
                        <g:elseif test="${message.role=='RETOUCHER'}">
                            <h4 class="shorter">Retoucher</h4>
                        </g:elseif>
                        <g:else>
                            <h4 class="shorter">Client</h4>
                        </g:else>


                        <p class="tall">${message.message}</p>
                    </div>
                </div>
            </li>
        </g:each>

    </ul>

    <g:if test="${task}">
        <div class="">
            <g:formRemote name="myForm" on404="alert('not found!')" update="messageHolder" url="[controller: 'project', action:'saveTaskMessage',id:task.id]">
                <textarea class="form-control" name="message" rows="3" data-plugin-maxlength="500" maxlength="500"></textarea>
                <p>
                    <code>max</code> 500 characters.
                </p>
                <g:submitButton class="mb-xs mt-xs mr-xs btn btn-primary col-md-3" style="float:right" name="submit" value="Send"/>
            </g:formRemote>
        </div>
    </g:if>



</div>