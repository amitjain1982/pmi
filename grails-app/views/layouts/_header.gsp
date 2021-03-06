<%@ page import="com.intelligrape.pmi.User" %>
<div class="navbar navbar-inverse" role="navigation">
    <div class="navbar-header"><a class="navbar-brand" href="#">
        PMI
    </a>
        <a class="sidebar-toggle"><i
                class="icon-paragraph-justify2"></i>
        </a>
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-icons"><span
                class="sr-only">Toggle navbar</span><i class="icon-grid3"></i></button>
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar">
            <span class="sr-only">Toggle navigation</span><i class="icon-paragraph-justify2"></i>
        </button>
    </div>

    <ul class="nav navbar-nav navbar-right collapse" id="navbar-icons">
        <li class="user dropdown"><a class="dropdown-toggle" data-toggle="dropdown">

            <span><sec:ifLoggedIn>
               <sec:username/>
            </sec:ifLoggedIn>
            </span><i
                    class="caret"></i></a>
            <ul class="dropdown-menu dropdown-menu-right icons-right">
                <li><a href="#"><i class="icon-user"></i> Profile</a></li>
                <li><a href="#"><i class="icon-cog"></i> Settings</a></li>
                <li><a href="/grails/plugin/springsecurity/logout"><i class="icon-exit"></i> Logout</a></li>
            </ul></li>
    </ul>
</div>
