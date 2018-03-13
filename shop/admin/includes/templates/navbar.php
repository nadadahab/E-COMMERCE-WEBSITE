<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
    <a class="navbar-brand" href="#"><i class="fa fa-cube fa-lg"></i>Shopping<b></a>  
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-nav" aria-expanded="false">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse navbar-right ml-auto" id="app-nav">
      <ul class="nav navbar-nav">
        <li><a href="dashboard.php">Home</a></li>
        <li><a href="categories.php">Categories</a></li>
        <li><a href="items.php">Items</a></li>
        <li><a href="members.php">Members</a></li>
        <li><a href="comments.php">Comments</a></li>
      </ul>

      <ul class="nav navbar-nav navbar-right">

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">nada<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="../index.php">Visit Shop</a></li>
            <li><a href="members.php?do=Edit&userid=<?php echo $_SESSION['ID'] ?>">Edit Profile</a></li>
            <li><a href="logout.php">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>


