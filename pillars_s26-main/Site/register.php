

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Welcome to Seven Pillars Game</title>
  <link rel="stylesheet" href="reg_style.css">
</head>
<body class="reg_bod">
  <h1>Register Here <b><?php echo htmlspecialchars($_SESSION["username"]); ?></b>!</h1>
  <img src="seven_img_asset.png" alt="comp logo" class="top-left-image" width="200" height="100">

  <div class="card">
    <div class="form-container">
      <form action="/guest.php" method="post">

        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" id="email" name="email">
        </div>

        <div class="form-group">
          <label for="fname">First Name</label>
          <input type="text" id="fname" name="fname">
        </div>

        <div class="form-group">
          <label for="lname">Last Name</label>
          <input type="text" id="lname" name="lname">
        </div>

        <div class="form-group">
          <label for="dob">Birth Date</label>
          <input type="date" id="dob" name="dob">
        </div>

        <div class="form-group">
          <label for="values">Which Value do you resonate with?</label>
          <select id="values" name="values">
            <option value="Death">Death</option>
            <option value="Character">Character</option>
            <option value="People First">People First</option>
            <option value="Compassionate" selected>Compassionate</option>
          </select>
        </div>

        <input type="submit" value="Submit" class="submit-btn">

      </form>
    </div>
  </div>
</body>
</html>