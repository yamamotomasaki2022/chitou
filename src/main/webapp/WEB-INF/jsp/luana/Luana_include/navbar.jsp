<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <img src ="images/chitou.png" />
  <a class="navbar-brand" href="Attractipon.jsp">Attraction page</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="allAttractions">Attractions</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="cart">Cart</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="order">Orders</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="searchAttractionReasults" method="post">
      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" name="attraction">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>