<html>
<head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
Example 1:
<select name ="example1" id="example1" class="abc">
    <option value="1">one</option>
    <option value="2">two</option>
    <option value="3">three</option>
    <option value="4">four</option>
</select>
 
 
<script>
$(document).ready(function() {
   
$('select[name="example1"]').val("4");
});
</script>
 
</body>
</html>