#!/bin/bash
yum update -y
mkdir ~/.ssh
chmod 700 ~/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYDA0dZe2y6WZsVx3XRSnX20zHThCY2chty28XecUlCh85uIs05IE/UQ9trxyF2HL222BOJDTZC9db+ek6FLbrWB4Mhf4ITPRZZA55Qcwu1/xJ+RzHmUfRQQ9IKNV/b0feAs5W9z2UQnXkbNuYAKm3F+WyqThD4LbWL0oF6BGn4Pmm0L5MXzRKNI4CSDaeUPnvAKwhGFpSF5tU13guQSkNYfwogmzWuOlDYO+aRC+fBPtbXACA+ypcsNEk2iQcTB/Q66dTabIJjujC4JHyT4c5y6uUDNz5pZQt1l3/FW3mFfwUpI64NKLp9/bdvNGpSApbhM+SviiHgnLw7Dx3RO5eD0SO6wgNw3cquf9z3WMyrDD65PRkS3R1BGw49WRv0C7MTrks1VrZEvPHvPW2L3EWEbbinWDFCSfzWVouW8tlRYQ8U3sLexf6vT3OusIvrT9CKIm3fzkjz7oGpFKG8EuOsOcLHQYqN9x4dU8hq3U0gl/XYlFHnMsVljkA4EP+YLk=' >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys