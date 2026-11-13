# TechHaven – Demo Video Script (English)

Total length: about 20 minutes, in three parts. Each part is spoken by **one person from start to end**, so the three recordings can be joined directly:

| Part | Speaker | Content | Time |
|------|---------|---------|------|
| 1 | **Nguyen Thanh Tung** (523H0192) | Storefront as a guest: home, catalogue, search, product page, real-time reviews, cart, discount, guest checkout, e-mail | ~7 min |
| 2 | **Duong Tran Quoc Khanh** (523H0040) | Accounts and orders: automatic account, register, Google, profile, addresses, passwords, signed-in checkout, loyalty, order history, tracking, Docker and scaling | ~7 min |
| 3 | **Nguyen Nam Phong** (523H0168) | AI assistant, admin dashboards, products, orders, users, discount codes, bonus evidence (RabbitMQ, CI) | ~7 min |

Rules from the project description: screen recording at **1080p or higher**, clear audio, show **every feature in the self-assessment**, **no theory** – show and say what is on screen.

---

## Before recording (everyone)

1. In the `source` folder: `docker compose down -v` then `docker compose up -d` (clean demo data). Wait until `docker compose ps` shows the `api` containers as **healthy**.
2. For Google sign-in, put `GOOGLE_CLIENT_ID` / `GOOGLE_CLIENT_SECRET` in `.env` (and `GEMINI_API_KEY` for the best AI answers), then `docker compose up -d` again.
3. Open these tabs: `http://localhost:8080`, `http://localhost:8080/admin`, `http://localhost:8025` (Mailpit), `http://localhost:15672` (RabbitMQ, techhaven / techhaven), the GitHub repo → **Actions**.
4. Prepare **two browser windows** side by side (one normal, one private/incognito) for the real-time review scene.
5. Recording order matters: Part 2 uses the guest order from Part 1, Part 3 changes the status of that order. Record in order 1 → 2 → 3 on the same running stack.

Accounts: admin `admin@techhaven.local / Admin@123` · customer `customer@techhaven.local / Customer@123` · discount `NEW26` · test card `4242 4242 4242 4242`, `12/29`, any CVC.

---

## PART 1 – Nguyen Thanh Tung: Storefront and guest checkout

**1.1 Opening** – *Do:* Show the home page at `localhost:8080`.
> "Hello, we are group 523H0192, 523H0040 and 523H0168. This is TechHaven, an e-commerce website that sells only computers and computer components, built with Node.js and Express. I am Nguyen Thanh Tung, and I will show the store as a guest, without signing in."

**1.2 Landing page** – *Do:* Scroll slowly: slides, Shop by need, Hot Deals, New Products, Best Sellers, Laptops, Desktop PCs, Monitors, Graphics Cards, Storage. Click a brand tab and page 2 in one section.
> "The landing page is the first page visitors see. It shows New Products, Best Sellers and five category sections: laptops, desktop PCs, monitors, graphics cards and storage. Every product list has page numbers, and each category section has brand tabs. Prices are formatted in Vietnamese dong, and products on sale show the original price and the discount."

**1.3 Catalogue and pagination** – *Do:* Click **All products**, then the **Laptops** category. Switch grid ↔ list. Click page 2 and the last page.
> "The catalogue is a separate page. Products show name, price, image and a short description, in grid view or list view. Pagination limits the number of products per page, and the page numbers are always visible."

**1.4 Sorting** – *Do:* Open the sort menu, choose Name A-Z, Name Z-A, Price low to high, Price high to low, then Newest and Best selling.
> "Products can be sorted by name A to Z and Z to A, by price ascending and descending, and also by newest, best selling, rating and biggest discount – eight criteria in total."

**1.5 Filtering** – *Do:* Tick two brands, type a min and max price, choose 4 stars and up, tick In stock and On sale, click a tag.
> "Filters can be combined: brand, minimum and maximum price, rating, in stock, on sale, category and tags. The result count and the pagination update immediately."

**1.6 Search (ElasticSearch)** – *Do:* Type `cors` slowly in the search box to show suggestions; then search `samsng`.
> "Search is powered by ElasticSearch. Suggestions appear while I type, and the search tolerates typing mistakes: 'samsng' still finds Samsung products."

**1.7 Product details and variants** – *Do:* Open a laptop. Click through the images, open the full-screen viewer. Point at name, brand, price, original price, overview. Click each variant: price and stock change. Scroll to specifications.
> "The product page shows the name, brand, price, a description of more than five lines and several images with a full-screen viewer. Every product has at least two variants. Each variant has its own price and its own stock, as you can see when I switch between them."

**1.8 Comments in real time + AI sentiment** – *Do:* Open the same product in the second (incognito) window, side by side. In window 1, as a guest, write a name and a positive comment, submit. Window 2 shows it instantly. Point at the sentiment label.
> "Guests can comment without signing in. I post a comment in the left window, and it appears instantly in the right window without reloading – this uses WebSocket. A moment later the comment receives an AI sentiment label: positive, neutral or negative."

**1.9 Star rating needs login** – *Do:* Point at the rating area: as a guest it shows “Sign in to rate this product with stars. Anyone can leave a comment.”
> "Rating with stars requires an account, so as a guest the page asks me to sign in first. My teammate will show the rating after signing in."

**1.10 Cart** – *Do:* Click **Add to cart** on two products (mini-cart opens). Open the cart. Change a quantity with + / –, remove one item.
> "When I add a product, the mini-cart opens. In the cart I can change quantities or remove items. The subtotal, VAT, shipping fee and total update immediately without reloading the page."

**1.11 Discount code** – *Do:* Type a wrong code `ABCDE` → error. Type `NEW26` → the discount line appears.
> "Discount codes have five letters or digits. A wrong code is rejected with a message. With NEW26 I see the discount and the new total before I pay."

**1.12 Guest checkout (3 steps)** – *Do:* **Checkout**. Step 1 Shipping: enter a new e-mail (e.g. `guest.demo@example.com`), name, phone, address. Step 2 Payment: choose card, enter `4242 4242 4242 4242`, `12/29`, `123`. Step 3 Review & confirm → **Place order**.
> "I check out as a guest, without an account. Step one is the shipping details, step two the payment, and step three reviews everything before I confirm. I use the test card."

**1.13 Success screen** – *Do:* Show the order success page: order number, items, address, totals, discount.
> "After a successful payment the order is created, and the success screen shows all the order information: number, products, address, discount and total."

**1.14 Confirmation e-mail** – *Do:* Switch to Mailpit `localhost:8025`. Open the order confirmation e-mail; show the second e-mail with the set-password link.
> "The customer receives an order confirmation e-mail with the details. Because I was a guest, an account was created automatically for this e-mail, and a second e-mail contains a link to set a password. My teammate Khanh will continue from here."

---

## PART 2 – Duong Tran Quoc Khanh: Accounts, orders and deployment

**2.1 Automatic account from guest checkout** – *Do:* In Mailpit, click the set-password link, enter a new password twice, save. Open **My orders**.
> "I am Duong Tran Quoc Khanh. I open the link from the guest order, choose a password, and I am signed in. In My orders, the order placed as a guest is already there, so a guest can review previous orders after signing in."

**2.2 Registration** – *Do:* Sign out. Click **Register**. Show the form: e-mail, full name and shipping address only. Submit with a new e-mail; show the set-password e-mail in Mailpit.
> "To register, a user enters only an e-mail, a full name and a shipping address. The password is chosen later through the link sent by e-mail."

**2.3 Google sign-in** – *Do:* Open **Sign in**, click **Continue with Google**, choose a Google account, return signed in. Sign out.
> "Users can also sign in with their Google account."

**2.4 Sign in and profile** – *Do:* Sign in as `customer@techhaven.local / Customer@123`. Open **Account**: edit full name and phone, save.
> "Now I sign in as the demo customer. On the profile page I can view and update my personal information."

**2.5 Multiple addresses** – *Do:* Add a second address, edit it, set it as default, delete an extra one.
> "A customer can manage several delivery addresses: add, edit, delete and choose the default one."

**2.6 Change password** – *Do:* Fill current password and a new password, save. (Change it back after recording, or use the new one.)
> "Here I change my password. The current password is required, and the new one needs at least eight characters with letters and digits."

**2.7 Password recovery** – *Do:* Sign out → **Forgot password?** → enter the e-mail → open the reset e-mail in Mailpit → set a new password → signed in.
> "If a user forgets the password, a recovery link is sent by e-mail, and the user can choose a new password from it."

**2.8 Star rating (signed in)** – *Do:* Open a product, give 5 stars with a short comment. The rating summary updates.
> "Now that I am signed in, I can rate a product with stars. No purchase is required. The average rating updates immediately."

**2.9 Signed-in checkout, address and loyalty points** – *Do:* Add a product to the cart → **Checkout**. Show the default address pre-filled; switch to the other saved address. In the **Loyalty points** box, click **Use max** (or type the points to use), show the points discount. Place the order (cash on delivery).
> "When a signed-in customer checks out, the default address is filled in automatically, and I can switch to another address. Customers earn ten percent of every order as loyalty points – one point is worth one thousand dong – and I can spend them immediately in this order."

**2.10 Order history and details** – *Do:* Open **My orders**: number, date, total, status, products and quantities. Open an order: status history table, newest on top. Show the points earned.
> "My orders lists every previous order with the order number, purchase date, total, status and the products with their quantities. The order details page shows the status history with timestamps, the most recent status at the top."

**2.11 Track order without signing in** – *Do:* Sign out, click **Track order** in the top bar, enter the order number and e-mail.
> "Anyone can also track an order with its order number and e-mail, without signing in."

**2.12 Deployment with Docker Compose** – *Do:* Terminal in the `source` folder: `docker compose up -d`, then `docker compose ps`.
> "The whole system runs with one command: docker compose up -d. Each component runs in its own container – frontend, gateway, API, database, and the other services – fifteen containers in total."

**2.13 Horizontal scaling** – *Do:* `docker compose up -d --scale api=5`, then `node tests/scale-demo.mjs 100`. Show the request count per replica. Optionally show the `X-Instance` header in the browser DevTools Network tab.
> "The API is stateless, so we can add servers at any time. I scale the API to five replicas and send one hundred requests. Nginx spreads them across all five replicas, as the X-Instance header shows. Next, Phong will show the AI assistant and the administrator area."

---

## PART 3 – Nguyen Nam Phong: AI assistant, administration and bonus evidence

**3.1 AI shopping assistant** – *Do:* On the store, open the chat bubble. Ask: `Tu van laptop gaming duoi 30 trieu`. Then ask a follow-up: `Con mau nao re hon khong?`. Then in English: `Do you have an RTX 4070?`. Click one suggested product.
> "I am Nguyen Nam Phong. This is our AI shopping assistant. I ask in Vietnamese for a gaming laptop under thirty million dong, and it recommends real products from our catalogue with price and stock. It remembers the context of my follow-up question, and it also answers in English. Clicking a suggestion opens the product."

**3.2 Admin sign-in and simple dashboard** – *Do:* Open `localhost:8080/admin`, sign in as `admin@techhaven.local / Admin@123`. Show **Overview**: total customers, new customers, orders, revenue, best-selling products chart, orders by status, needs attention.
> "This is the administrator area. The simple dashboard shows the total number of users, new users, orders, revenue, and the best-selling products as charts."

**3.3 Advanced dashboard** – *Do:* Click **Advanced analytics**. Yearly is selected by default. Switch to Quarterly, Monthly, Weekly, then Custom range with a start and end date → apply.
> "The advanced dashboard shows the data yearly by default. I can switch to quarterly, monthly, weekly or a custom start and end date. For each period it shows the number of orders, revenue and profit, with comparison charts for revenue, profit, number of products and product types sold."

**3.4 Product management** – *Do:* **Products** → **Add product**: name, brand, category, description; add two variants with price, cost and stock; upload three images. Save. Edit the stock of one variant. Delete the test product. Open **Categories**, add a category.
> "In product management the administrator can add, update and delete products. Each product has variants with their own price and stock, and several images. Inventory is handled per variant. Categories are managed here too."

**3.5 Order list** – *Do:* **Orders**: newest first, 20 per page, page 2. Filter Today, Yesterday, This week, This month, then a date range.
> "The order list shows all orders, newest first, twenty per page. I can filter by today, yesterday, this week, this month or a specific date range."

**3.6 Order details and status** – *Do:* Filter **Today**, open the guest order from Part 1: buyer, time, total, discount NEW26, products. Change status Pending → Confirmed → Shipping. Switch to Mailpit: the status update e-mail. Switch to the customer's order page: the status history now has the new rows on top.
> "In the order details I see the buyer's name, the purchase time, the total, the discount code that was applied, and the products. I change the status from pending to confirmed and then to shipping. The customer gets an e-mail, and the status history on the customer side shows the newest status at the top."

**3.7 User management** – *Do:* **Users**: list, open a customer, edit the name, save. Click **Ban** on a seeded customer (not the demo customer), confirm. Try to sign in as that user in the incognito window → blocked. Unban.
> "In user management the administrator can view all users, update their information, and ban a user. A banned user can no longer sign in."

**3.8 Discount management** – *Do:* **Discount codes**: show the list with creation time, value, used / limit. Open NEW26 → list of orders that used it (the guest order is there). Create a new code `DEMO5`, 5%, limit 10 → saved. Try limit `11` or a 6-character code → validation error.
> "Here are the discount codes with their creation time, value, and how many times each one has been used out of its limit. For each code I can see the orders that used it – including the order we just placed. I create a new five-character code with a limit of ten uses. A limit above ten, or a code that is not five characters, is rejected."

**3.9 Responsive design** – *Do:* Open DevTools device toolbar: iPhone width on home page, product page and cart; then tablet width on the catalogue.
> "The website is responsive. On a phone and on a tablet the layout adapts, and all functions remain easy to use."

**3.10 Bonus evidence: microservices and RabbitMQ** – *Do:* Open RabbitMQ at `localhost:15672` → **Queues**: show the durable queues used by the mailer, search and assistant services and their message rates.
> "For the bonus features: the back end follows a microservices architecture with five Node.js services – API, realtime, mailer, search and assistant. They communicate asynchronously through these RabbitMQ queues and Redis pub/sub."

**3.11 Bonus evidence: CI/CD** – *Do:* GitHub repo → **Actions**: open the latest green run, show the unit-test and end-to-end jobs.
> "Every push runs our GitHub Actions pipeline with the unit tests and the end-to-end scenario."

**3.12 Closing** – *Do:* Return to the home page.
> "That completes the demonstration of TechHaven: every customer and administrator feature, plus four bonus features – CI/CD, microservices, AI and ElasticSearch. Thank you for watching."

---

## Rubric checklist (tick while recording)

| Rubric item | Part / step |
|---|---|
| 1 Social login | 2.3 |
| 2 View profile | 2.4 |
| 3 Change password | 2.6 |
| 4 Password recovery | 2.7 |
| 5 Multiple addresses | 2.5 |
| 6 Purchase history | 2.1, 2.10 |
| 7 Purchase details | 2.10 |
| 8 Landing page | 1.2 |
| 9 Catalogue by category | 1.3 |
| 10 Pagination | 1.2, 1.3 |
| 11 Product details | 1.7 |
| 12 Variants | 1.7 |
| 14 Keyword search | 1.6 |
| 15 Filtering | 1.5 |
| 16 Ordering | 1.4 |
| 17 Display cart | 1.10 |
| 18 Update cart | 1.10 |
| 19 Checkout | 1.12, 2.9 |
| 20 Discount code | 1.11 |
| 21 E-mail after order | 1.14 |
| 22 Comment | 1.8 |
| 23 Star rating | 1.9, 2.8 |
| Real-time review (WebSocket) | 1.8 |
| 24 Loyalty | 2.9 |
| 25 Product management | 3.4 |
| 26 User management | 3.7 |
| 27 Simple dashboard | 3.2 |
| 28 Advanced dashboard | 3.3 |
| 29 Order list | 3.5 |
| 30 Order details + status | 3.6 |
| 31 Discount management | 3.8 |
| Deployment (Docker Compose) | 2.12 |
| Horizontal scaling | 2.13 |
| Responsive | 3.9 |
| Bonus: AI | 1.8, 3.1 |
| Bonus: ElasticSearch | 1.6 |
| Bonus: Microservices + async | 3.10 |
| Bonus: CI/CD | 3.11 |
