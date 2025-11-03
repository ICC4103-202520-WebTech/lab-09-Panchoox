<<<<<<< HEAD
# Lab 10 — Deploying the Recipe Book Application with Kamal on DigitalOcean

## Objective
Deploy your Recipe Book application to a live server using **Kamal** and **DigitalOcean**.  
By the end of this lab, you should have your application running online, accessible through a temporary DigitalOcean IP (no domain required).

This lab consolidates your knowledge of:
- Preparing a Rails app for production.
- Using **Kamal** for simple and reproducible deployments.
- Working with **DigitalOcean droplets**.
- Managing environment variables and secrets in production.

## Instructions
1. **Prepare Your Application for Production**
   - Make sure your application runs correctly in development.
   - Commit all recent changes to your Git repository.
   - Check that your database configuration supports the `production` environment.
   - Ensure all required environment variables are defined (`RAILS_MASTER_KEY`, `DATABASE_URL`, etc.).

2. **Set Up DigitalOcean**
   - Create a new **droplet** (you can use the referral link provided by your instructor to get free credits).
   - Configure SSH access so Kamal can deploy to the droplet.
   - You do **not** need a custom domain — the server’s IP address will be enough.

3. **Install and Configure Kamal**
   - Add Kamal to your project and initialize the configuration.
   - Set up your `kamal.yml` file with:
     - The server IP address.
     - The image name and repository (if you use Docker Hub or GitHub Container Registry).
     - Environment variables for production.

4. **Deploy the Application**
   - Use Kamal to build and deploy your app to the droplet.
   - Verify that the application is accessible via the droplet’s public IP.

5. **Post-Deployment Verification**
   - Visit the IP in your browser and confirm that:
     - The home page loads.
     - You can sign up and log in.
     - Recipes can be created and displayed correctly.
   - Check that logs and containers are running as expected on the server.

## Deliverables
- Recipe Book application successfully deployed to DigitalOcean using Kamal.
- A short write-up (in Markdown or PDF) explaining:
  - The steps you followed.
  - Any issues encountered and how you solved them.
  - The IP address where the app can be accessed.
- Clean repository ready for evaluation.
=======
# Lab 8 — Recipe Book Application: Authorization and User Roles

## Objective
Extend the Recipe Book application by implementing **authorization** so that only certain users can perform specific actions.  
You will use either **CanCanCan** or **Pundit** to manage permissions, and define user **roles** in the `User` model using an `enum`.

By the end of this lab:
- Users with different roles will have different access levels.
- You will understand how to define and enforce authorization rules in Rails.

## Instructions
1. **Add Roles to the User Model**
   - Add an `enum` field called `role` to the `User` model.  
     Suggested roles:
       - `regular` (default)
       - `admin`
   - Update or seed the database to include at least one admin user.

2. **Choose an Authorization Library**
   - Use either **CanCanCan** or **Pundit** for this lab.  
   - Install and configure the gem following its documentation.
   - Create the necessary files (`Ability` for CanCanCan or `Policy` for Pundit).

3. **Define Authorization Rules**
   - **Admin users** should be able to:
     - Manage all recipes (create, edit, delete, view).
     - Manage all users (optional if you want to extend functionality).
   - **Regular users** should be able to:
     - Create new recipes.
     - Edit or delete **only their own** recipes.
     - View all recipes.

4. **Apply Authorization in Controllers**
   - Add the proper checks in controllers to enforce permissions.
   - Redirect users or show an error message when they try to access unauthorized actions.

5. **User Interface**
   - Update the navigation bar to show or hide options based on the user’s role.
     - For example, only admins should see management links.
   - Add friendly messages when a user attempts to perform an unauthorized action.

## Deliverables
- Recipe Book application extended with authorization using CanCanCan or Pundit.
- Users have defined roles (`regular` and `admin`).
- Regular users can only manage their own recipes.
- Admins can manage all recipes.
- Interface updated to reflect available actions according to user role.

>>>>>>> 819c23b (Lab8: roles + CanCanCan authorization, UI updates, seeds and README)
