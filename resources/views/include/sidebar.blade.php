        <!-- Left Sidebar -->
        <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                    <img src="{{ url('images/user.png') }}" width="48" height="48" alt="User" />
                </div>
                <div class="info-container">
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{ Auth::user()->name }}</div>
                    <div class="email">{{ Auth::user()->email  }}</div>
                    <div class="btn-group user-helper-dropdown">
                        <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="javascript:void(0);"><i class="material-icons">person</i>Profile</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="javascript:void(0);"><i class="material-icons">group</i>Followers</a></li>
                            <li><a href="javascript:void(0);"><i class="material-icons">shopping_cart</i>Sales</a></li>
                            <li><a href="javascript:void(0);"><i class="material-icons">favorite</i>Likes</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="{{ url('logout') }}"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <ul class="list">
                    <li class="header">MAIN NAVIGATION</li>
                    <li class="active">
                        <a href="{{ url('/') }}">
                            <i class="material-icons">dashboard</i>
                            <span>Dashboard</span>
                        </a>
                    </li>

                    @php
                        $side_menu = sideMenu(Auth::user()->role_id) 
                    @endphp


                    @foreach($side_menu as $value)
                      
                   @if(count($value['sub_menu'])>0)
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">{{ $value['icon'] }}</i>
                            <span>{{ $value['name'] }}</span>
                        </a>
                        <ul class="ml-menu">

                            @foreach($value['sub_menu'] as $sub)
                            <li>
                                <a href="{{ $sub->menu_url ? route($sub->menu_url) : '' }}" >
                                    <span>{{ $sub->name }}</span>
                                </a>
                          
                            </li>         
                            @endforeach
            
                        </ul>
                    </li>
                    @else
                    

    
                    <li>
                        <a href="{{ $value['url'] ? route($value['url']) : '' }}">
                            <i class="material-icons">{{ $value['icon'] }}</i>
                            <span>{{ $value['name'] }}</span>
                        </a>
                    </li>

                    @endif



                    @endforeach()

               


            


          
                </ul>
            </div>
            <!-- #Menu -->
            <!-- Footer -->
    <!--         <div class="legal">
                <div class="copyright">
                    &copy; {{ date('Y') }} <a href="javascript:void(0);">Belogin Technologies Ltd</a>.
                </div>
                <div class="version">
                    <b>Version: </b> {{ rand(0,3) }}.{{ rand(0,9) }}.{{ rand(0,9) }}
                </div>
            </div> -->
            <!-- #Footer -->
        </aside>
        <!-- #END# Left Sidebar -->