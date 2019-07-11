provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "optimy-test" {
  ami           = "ami-080d4d4c37b0aa206"
  instance_type = "t2.micro"
  key_name        = "${aws_key_pair.optimy_key.key_name}"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y apache2 php libapache2-mod-php mysql-client-core-5.7 php7.0-mysqli
              echo 'create table optimy(id INT NOT NULL AUTO_INCREMENT, output VARCHAR(100) NOT NULL, PRIMARY KEY(id));' | mysql -uadmin -poptimy123 -h ${aws_db_instance.optimy_db_test.address} optimy_test_database
              echo 'INSERT INTO optimy(output) values ("Hello World");' | mysql -uadmin -poptimy123 -h ${aws_db_instance.optimy_db_test.address} optimy_test_database
              

sudo cat << EOP >> /var/www/html/test.php
<?php
$conn = new mysqli("${aws_db_instance.optimy_db_test.address}", "admin", "optimy123", "optimy_test_database");
$sql = 'SELECT output FROM optimy';

$result = mysqli_query($conn, $sql);

while($row = mysqli_fetch_assoc($result)) {
        echo "<b>" . $row["output"]. "<br>";
}
$conn->close();
?>
EOP
EOF
  
  tags = {
    Name = "optimy-test"
  }
}


/* to add to the script
echo 'create table optimy(id INT NOT NULL AUTO_INCREMENT, output VARCHAR(100) NOT NULL, PRIMARY KEY(id));' | mysql -uadmin -poptimy123 -h ${var.db_address} optimy_test_database
echo 'INSERT INTO optimy(output) values ("Hello World");' | mysql -uadmin -poptimy123 -h ${var.db_address} optimy_test_database

<?php
$conn = new mysqli("optimy20190711171227448300000001.cvmtxy3vixlb.eu-west-3.rds.amazonaws.com", "admin", "optimy123", "optimy_test_database");
$sql = 'SELECT output FROM optimy';

$result = mysqli_query($conn, $sql);

while($row = mysqli_fetch_assoc($result)) {
        echo "<b>" . $row["output"]. "<br>";
}
$conn->close();
?>
*/
  