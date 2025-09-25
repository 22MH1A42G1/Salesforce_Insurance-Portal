## **Phase-02: Org & Setup Configuration**

In this phase, the goal is to configure the Salesforce organization baseline and prepare the environment for building the Insurance Portal. This includes company information, users, roles, security, and enabling Experience Cloud.

---

### **Step 1: Salesforce Org Preparation**

1. Log in to your **Salesforce Developer Edition** (or Sandbox).
2. Go to **Setup** (⚙️ → Setup).
3. Navigate to **Company Settings → Company Information**:

   * Verify Company Name, Address, Phone, and Primary Contact.
   * Set **Fiscal Year** to align with insurance company needs.
   * Configure **Business Hours** and **Holidays** (important for SLA/Claims).

---

### **Step 2: Enable Key Features**

1. **Experience Cloud (Community Portal)**

   * Setup → Digital Experiences → Settings → Enable Digital Experiences.
   * Register your domain (e.g., `insuranceportal.force.com`).
2. **Files & Notes**

   * Enable **Files Connect** if you want integration with external drives.
3. **Field History Tracking**

   * Enable for **Policy** and **Claim** objects (to track changes in status, premium, etc.).

---

### **Step 3: User Roles & Profiles**

1. **Roles**

   * Create roles: `Insurance Agent`, `Claims Handler`, `Underwriter`, `Customer (Portal)`.
   * Define role hierarchy (e.g., Managers → Agents → Customers).
2. **Profiles**

   * Assign **System Administrator** for you.
   * Create a **Portal User Profile** for customers (based on Customer Community).
   * Create **Custom Profiles** for Agents and Underwriters with object-level permissions.
3. **Permission Sets** (optional)

   * Create permission sets for advanced access like “Claims Management” or “Policy Approval.”

---

### **Step 4: Security & Access Setup**

1. Go to **Sharing Settings**:

   * Set **Policy** and **Claim** objects to **Private** (org-wide default).
   * Create **Sharing Rules** so Agents can see only their assigned Policies/Claims.
2. Enable **Login & Session Security**:

   * Add trusted IP ranges.
   * Enable **Two-Factor Authentication (2FA)** for internal users.

---

### **Step 5: Lightning Apps & Navigation**

1. **Create a Lightning App** called *Insurance Workspace*:

   * Add objects: Policy, Claim, Quote, Payment.
   * Customize navigation items for agents and managers.
2. **Customize Record Pages** using **Lightning App Builder**:

   * Add **Related Lists** (e.g., show Claims under Policy).
   * Add **Quick Actions** like “File Claim” or “Upload Document.”

---

### **Step 6: Branding & Org Settings**

1. Add your **Company Logo** in **Theme & Branding**.
2. Create a **Custom App Branding** (colors, logos).
3. Setup **Email Deliverability** (Setup → Deliverability → All Emails).

---

✅ **Deliverables for Phase-02:**

* Org baseline configured (Company info, fiscal year, business hours).
* Experience Cloud enabled and domain registered.
* Roles, Profiles, and Permission Sets created.
* Security model applied (sharing, OWD).
* Insurance Workspace Lightning App ready.

---
