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

                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">widgets</i>
                            <span>Product</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="{{ route('supplier.index') }}" >
                                    <span>Vendor</span>
                                </a>
                          
                            </li>         

                            <li>
                                <a href="{{ route('category.index') }}" >
                                    <span>Product Category</span>
                                </a>
                          
                            </li>    

                             <li>
                                <a href="{{ route('product.index') }}" >
                                    <span>Product</span>
                                </a>
                          
                            </li>
            
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">compare_arrows</i>
                            <span>Stock Management</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="{{ route('stock.index') }}">Stock In</a>
                                <a href="{{ route('invoice.index') }}">Stock Out/Invoice</a>
                            </li>
                           
                        </ul>
                    </li>   


       


                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">show_chart</i>
                            <span>Report</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="{{ route('report.index') }}">All Report</a>
                            </li>
                           
                        </ul>
                    </li>

                   <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">account_circle</i>
                            <span>Customer</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="{{ route('customer.index') }}">Customer</a>
                            </li>
                           
                        </ul>
                    </li>  


                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">people</i>
                            <span>User Manage</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="{{ route('role.index') }}">Role</a>
                                <!-- <a href="{{ route('report.index') }}">Role Permission</a> -->
                                <a href="{{ route('user.index') }}">User</a>
                            </li>
                           
                        </ul>
                    </li>


            


    
                    <li>
                        <a href="pages/changelogs.html">
                            <i class="material-icons">update</i>
                            <span>Changelogs</span>
                        </a>
                    </li>
          
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