# Basic Nginx Web Server & Rsync Deployment

This project demonstrates the fundamental workflow for deploying a static HTML/CSS website to a remote server. It covers setting up a basic Nginx web server on an Ubuntu EC2 instance and using `rsync` to synchronize local files to the live server.

---

## 🚀 Live Demo

The final deployed website can be viewed at the following address:

**[http://13.127.11.176](http://13.127.11.176)**
<img width="1647" height="487" alt="image" src="https://github.com/user-attachments/assets/9b0f7c7f-3661-4c2e-b183-127c98586d37" />



---

## 📂 Project Structure

The project is organized on the local machine as follows. The `my-static-site` directory contains the website files, and `deploy.sh` is the script used to push those files to the server.

```
.
├── deploy.sh
└── my-static-site
├── css
│   └── style.css
└── index.html

```
---

## 🛠️ Setup and Deployment

This guide is split into two parts: the one-time server setup and the repeatable deployment workflow.

### 1. One-Time Server Setup (On the EC2 Instance)

These steps prepare the remote server to host the website.

1.  **Install Nginx**:
    ```bash
    sudo apt update
    sudo apt install nginx -y
    ```
2.  **Create Web Directory**:
    ```bash
    sudo mkdir -p /var/www/[mywebsite.com/html](https://mywebsite.com/html)
    ```
3.  **Set Permissions**:
    ```bash
    # Replace 'ubuntu' if your EC2 user is different
    sudo chown -R ubuntu:ubuntu /var/www/[mywebsite.com/html](https://mywebsite.com/html)
    ```
4.  **Create Nginx Config**: Create a new server block at `/etc/nginx/sites-available/mywebsite.com` with the following content:
    ```nginx
    server {
        listen 80;
        root /var/www/[mywebsite.com/html](https://mywebsite.com/html);
        index index.html;
        server_name 13.127.11.176; # Your server's IP
    }
    ```
5.  **Enable Site & Disable Default**:
    ```bash
    # Enable your new site
    sudo ln -s /etc/nginx/sites-available/mywebsite.com /etc/nginx/sites-enabled/
    # Disable the default Nginx page
    sudo rm /etc/nginx/sites-enabled/default
    ```
6.  **Restart Nginx**:
    ```bash
    sudo systemctl restart nginx
    ```

### 2. Deployment Workflow (From Your Local Machine)

This is the process you'll follow every time you update your website.

1.  **Edit Files Locally**: Make changes to the HTML and CSS files inside the `my-static-site` directory on your computer.
2.  **Run the Deployment Script**: Execute the `deploy.sh` script from your project's root directory.
    ```bash
    ./deploy.sh
    ```
    The script uses `rsync` to copy your local files to the `/var/www/mywebsite.com/html` directory on the EC2 server.
3.  **Verify Changes**: Refresh your browser on the live URL to see the updates.

---

## 💻 Technologies Used

* **Web Server**: Nginx
* **Deployment Tool**: `rsync`
* **Hosting**: Amazon EC2 (Ubuntu)
* **Protocols**: SSH

---

### Project URL:
[https://roadmap.sh/projects/static-site-server](https://roadmap.sh/projects/static-site-server)
