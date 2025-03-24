# Use an official Ubuntu base image
FROM ubuntu:22.04

# Update the package repository and install Apache2
RUN apt-get update && apt-get install -y apache2

# Expose port 80 (the default HTTP port for Apache)
EXPOSE 80

# Copy the website content to the Apache default directory
COPY index.html /var/www/html/

# Start Apache2 in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
