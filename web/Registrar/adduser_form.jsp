<h3>Add user</h3>
<div class="form-group">
    <form class="form-group" method="post" action="">
        <div class="form-group col-lg-4">
            Choose user ID
            <select class="form-control" name="userid">
                <option>id1</option>
                <option>id2</option>
                <option>id3</option>
            </select>
        </div>
        <div class="form-group col-lg-4">
            Enter user name
            <input type="text" name="username" class="form-control">
        </div>
        <div class="form-group col-lg-4">
            Enter password
            <input type="text" name="password" class="form-control">
        </div>
        <div class="form-group col-lg-4">
            Re-enter password
            <input type="text" name="repass" class="form-control">
        </div>
        <div class="form-group col-lg-4">
            <br>
            <input type="submit" id="btnadduser" class=" btn btn-primary">
        </div>
    </form>
</div>
<script type="text/javascript">
    $("#btnadduser").click(function () {
        alert("heu");
    });
    function adduser()
    {

    }

</script>