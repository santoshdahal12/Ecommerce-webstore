<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Product
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Main row -->
      <div class="row">
        <!-- Left col -->
        <section class="col-lg-12 connectedSortable">
              <!-- TO DO List -->
          <div class="box box-primary">
            <div class="box-header">
              <i class="ion ion-clipboard"></i>

              <h3 class="box-title">Add Product</h3>
				<h1>
							<!-- Hello <b><c:out value="${user.name}" /></b>  -->
				</h1>
				<div class="col-md-6">
					<form:form action="product" commandName="product" method="POST" enctype="multipart/form-data">
						<div class="form-group">
						  <label for="exampleInputEmail1">Name</label>
						  <form:input path="name" cssClass="form-control"/>
						  <form:errors path="name"></form:errors>
						</div>	
						<%-- <div class="form-group">
						  <label for="exampleInputEmail1">Quantity</label>
						  <form:input path="qty" cssClass="form-control"/>
						</div> --%>
						<div class="form-group">
						  <label for="exampleInputEmail1">Price</label>
						  <form:input path="price" cssClass="form-control"/>
						  <form:errors path="price"></form:errors>
						</div>
						<div class="form-group">
						  <label for="exampleInputEmail1">Category</label>
						  <form:select path="category" cssClass="form-control">
								<form:option value="" label="Select Category" />
								<form:options path="${availableOptions}" />
							</form:select>
						</div>
						<div class="form-group">
						  <label for="exampleInputEmail1">Availability</label>
						 <form:input path="productAvailability" cssClass="form-control"/>
						  <form:errors path="price"></form:errors>
						</div>
						<div class="form-group">
						  <label for="exampleInputEmail1">Image</label>
						  <form:input path="image" type="file" class="form-control" />
						</div>
						<div class="form-group">
							<input type="submit" value="Submit" class="btn btn-success btn-sm"/>
						</div>
					</form:form>
				</div>
          </div>
          <!-- /.box -->
        </section>
        <!-- /.Left col -->
      </div>
      <!-- /.row (main row) -->
		</div>
    </section>
    <!-- /.content -->	