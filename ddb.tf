resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "${var.namespace}-ddb-cluster"
  engine                  = "docdb"
  master_username         = "foo"
  master_password         = "movetoparameters"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 2
  identifier         = "${var.namespace}-docdb-inst-${count.index}"
  cluster_identifier = "${aws_docdb_cluster.docdb.id}"
  instance_class     = "db.r4.large"
}