---
layout: default
paddle: true
image: /images/hotwire-in-hands.png
---

<script async data-uid="feaa96bc97" src="https://thoughtful-producer-2834.kit.com/feaa96bc97/index.js"></script>

<div class="top-right-container">
  <div class="sales-text">
    <div class="sales-number">200+</div>
    <div class="sales-label">copies sold</div>
  </div>
  <a
    class="buy-button buy-button-top-right"
    data-turbo="false"
    data-controller="checkout"
    data-action="checkout#start"
    data-checkout-price-id-value="<%= ENV["PADDLE_PRICE_ID"] %>">
    <b>Buy now</b>
  </a>
</div>


# Master Hotwire
{: .mb-0}

![Boy hands holding two wires with a bright yellow spark between them](/images/hotwire-in-hands.png){: width="60%"}
{: .center.mt-0.mb-0}

## Build Modern Web Apps with Rails Simplicity
{: .mt-0}

*An e-book for experienced Rails developers to quickly get up to speed with Hotwire.*

Written by [Radan Skorić](https://radanskoric.com).

## Can modern web UI be simple and fun to build?

Do you feel like the mainstream approaches to building a modern web UI have become too complicated? You're spending more time *plugging everything together* than actually implementing the solution.

It used to be so simple. Write the backend logic, sprinkle jQuery effects, add some AJAX calls and you're golden. Unfortunately that was hard to maintain when the application grew. And users expect a more polished experience. It's no longer enough.

The usual industry solution are Single Page Applications (SPAs). They deliver a great UX but also bring many problems:
- 2 different applications (backend and frontend) that have to synchronise state.
- Business logic being duplicated between backend and frontend.
- A complex API to maintain.
- An arcane build system that regularly breaks.
- A whole frontend framework to learn with a completely different way of working compared to the backend.
- Every new feature that spans both the backend and the frontend takes a long time to implement.

Imagine that you can develop with the old speed and simplicity but still deliver a polished and modern user experience.
How good would that be?

## Is HTML-over-the-wire the fix?

**Hotwire**, or HTML over the wire, recaptures the old ease of development while keeping the modern user experience. Everything we need to render the correct HTML is already right here on the server, in our **backend logic**. It's crazy to have to serialise it to JSON, ship to a completely different frontend application, deserialise it, pass it through a dozen nested components which update the Virtual DOM which then, finally, finally, updates the counter widget. Yes, of course, I'm paraphrasing but I think you get the point.

HTML-over-the-wire is a **game changer**, especially when paired with a super productive backend framework like **Ruby on Rails**. It's doing a full circle. It's going back to tried and true, "boring" Hypermedia technology: HTTP and HTML. This time, thanks to browser advancements, Hotwire enhances it so it can be used for building a highly responsive and modern user experience.

## Can picking Hotwire turn out to be a mistake?

However, Hotwire is not a free lunch. A poorly designed Hotwire application can:
- be hard to maintain
- end up being sluggish to use
- lead to higher server resource usage

It's a different way of developing the applications and it has its quirks and gotchas. If you don't understand how to use it, you can end up questioning your lifestyle choices.

Used correctly it will dramatically boost your productivity. But if you use it incorrectly you can be left feeling like you're fighting it.
Good news is that you definitely can avoid the negative scenario.

### Used correctly it will not be a mistake

It's absolutely possible to build a complex application with Hotwire that's maintainable and a joy to work on.

However, you do need to:
- Build the correct mental model of how it works.
- Understand the tradeoffs being made.
- Learn to compose the solution in a Hotwire friendly way.
- Gain an understanding of the inner workings of Hotwire.

Hotwire is a powerful tool that powers a very fast, productive and high quality way of developing applications. You can recapture the simplicity of development you once enjoyed while still delivering a modern user experience. Implementing UIs really can be fun!

## "I am trying to understand it and find it extremely convoluted"

A poorly designed Hotwire application can get out of hand by:
- Having long brittle update logic turning Rails controllers into a spaghetti mess.
- Naive use of Turbo Frames can lead to related logic being scattered across the app.
- Leave you wondering "where is this piece of UI even coming from??"
- Using hard to follow solutions for simple things that don't work out of the box with Turbo.
- Break in strange ways.

Just like Ruby and Ruby on Rails, Hotwire is a sharp knife. It's very powerful but you can cut yourself.
As with all such technologies the secret is in getting proficient at using it.

Once you **master** a sharp knife you can get a lot done quickly without the danger of cutting yourself.

### What would it mean if you were as fluent with Hotwire as you are with Rails itself?

You could:
- Get so much **more** done in less time.
- Actually **finish** that side-project with the little spare time that you have.
- Use your knowledge of server side rendering to **build** modern web UIs.
- **Increase** the value of your existing Rails knowledge.
- Recapture the **joy** of developing web applications that you once had.

Hotwire applications *can* turn into *spaghetti* code with RESTless Rails controllers and hard to follow Stimulus controllers, but they don't have to. Once you understand it you can avoid its pitfalls and play to its strengths. This is what you did with all powerful technologies that you mastered before. The best antidote to pitfalls of a powerful tool is your **deep understanding** of how it works and how best to use it.

How much more confident would you be if you had that **understanding**?

<%= render "cta" %>

## "How would you implement this UI with Hotwire?"

A common question is how one would implement a particular UI using Hotwire.

You already know how to implement the actual problem solving part but you *don't* know how to *assemble* it using Hotwire in an **elegant and maintainable** way.

What if:
- You knew exactly how to implement complex features using Hotwire?
- You knew how to keep everything simple and performant?
- Building with Hotwire was as easy to you as building a plain HTML page?

You could focus most of your energy on the really interesting part, on the part of the code that is actually solving the user problem.
You would be able to reap full benefits of Hotwire's compression of complexity.

This is what is waiting for you inside my **short e-book**: "Master Hotwire".

Learn in bite-sized step by step lessons, guiding you through development of a collaborative *Kanban board application*. Immediately actionable knowledge is delivered in every lesson, starting with the very first one. You could even develop your own application in parallel, as you go.

![An image sample of Kanban board building part](/images/pdfsamplecodealong.png){: .fade-vertical width="100%"}

## Get a deep understanding to implement the best solution

Official documentation and most online tutorials and courses explain how to **use** Hotwire. That is enough for you to build your application but it's not enough to really know if you picked the best approach and built a long term maintainable application. It's not enough to quickly fix unexpected issues. For that you need a **deep understanding**.

After introducing each concept, the book takes another step and explains how each part of Hotwire actually works under the hood. This is what you need to know that you picked the best solution. This is what enables you to debug issues in **minutes, not hours**.

![An image sample of a deep dive chapter](/images/pdfsampledeepdive.png){: .fade-vertical width="100%"}

### What if you're too busy?

You're probably busy, you don't have much time to read another **book**.

This is why the book is aimed at **experienced** developers! Most tutorials spend a lot of time with the basics. But you're experienced and you don't need that much hand holding.

Because you are experienced, I can condense the material, **saving you time**. I can then dig under the hood, giving you a **deeper understanding**. A junior developer would be overwhelmed by it but for you this might be the most interesting part.

It's condensed experienced that you are able to consume in a short amount of time because of your existing expertise.

You will gain an accurate mental model and understanding of Hotwire. You will be able to connect it to the body of knowledge and experience you already posses to develop new or introduce Hotwire to existing applications with complete confidence.

### Is Hotwire Native really a shortcut to launching a native mobile app?

Hotwire Native has recently improved **in strides** but it's still hard to tell if its a viable option for your project.

For many projects it really is a shortcut to a native app that is so fast it will feel like you're cheating. While other teams are recreating their web apps using mobile technology, you'll be able to package and ship your web app as a native app **in a fraction of the time**. And once you understand how to do it properly, users will not be able to tell the difference.

However, it's not the right fit for every project. Thankfully, the same deep understanding of how it works and how to use it properly will give you a clear understanding of when to use it.

This is exactly what's waiting in Part II of "Master Hotwire". And it doesn't require you to spend a lot of time learning native development. When you finish Part II you will understand how it works and you'll be able to build and launch a native app mostly using your existing web development skills. For a lot of projects this is more than enough. And if you need to push it further, you'll be able to use any native development resources. Hotwire Native enables that and "Master Hotwire" gives you the needed understanding.

*The Hotwire Native content is launching next Tuesday, July 22nd. You will automatically get it if you purchase now.*

<%= render "cta" %>

## What readers are saying

<div class="reviews">
  <% site.data.reviews.each do |review| %>
    <div class="review-box">
      <blockquote><%= review[:quote] %></blockquote>
      <div class="reviewer">
        <% if review[:link] %>
          <a href="<%= review[:link] %>" target="_blank" rel="noopener"><%= review[:name] %></a>
        <% else %>
          <%= review[:name] %>
        <% end %>
        <span class="reviewer-title">, <%= review[:title] %></span>
      </div>
    </div>
  <% end %>
</div>

## List of chapters

Wondering what's inside? Here's the list of chapter titles:

- Preface
- 1.0. Part I - Where you learn how to implement a Hotwire web application
  - 1.1. Start with a plain HTML application
  - 1.2. Understand Turbo Drive enhancements
  - 1.3. Enjoy the magic of link prefetching
  - 1.4. Upgrade with Turbo Frames
  - 1.5. Intermezzo - Significance of progressive enhancement for HTML-over-the-wire
  - 1.6. Fine grained control with Turbo Streams
  - 1.7. Introduce Turbo Morphing
  - 1.8. Make the application collaborative with ActionCable
  - 1.9. Improve UX with Stimulus
  - 1.10. Stimulus being different from other frontend frameworks helps when a Hotwire application grows
  - 1.11. Exercise - Allow creating tickets directly in the columns
- 2.0. Part II: Where you learn how to package a web app into native mobile apps with Hotwire Native
  - 2.1. History of Hotwire Native
  - 2.2. Mobile apps UI is different from the web
  - 2.3. Create a new Hotwire Native application
  - 2.4. Enhance the application without custom native code
  - 2.5. Customise mobile screens with Path Configuration
  - 2.6. Utilise Bridge Components
  - 2.7. Publish native applications
  - 2.8. Where to go from here?
- 3.0. Part III: Where you learn how to take it further *(coming soon)*
  - 3.1. How to debug Hotwire applications *(coming soon)*
  - 3.2. Understand how Turbo manages browsing history *(coming soon)*
  - 3.3. Advanced Stimulus usage *(coming soon)*
  - 3.4. How to load test Turbo powered applications *(coming soon)*
  - 3.5. Adding Turbo to a legacy application *(coming soon)*

## Build that side-project in record time

If your day job is a huge legacy application, switching to Hotwire might seem like an impossible task. And while the book also has a special section on introducing Hotwire to a legacy application, it's also perfect for launching a side-project.

Hotwire and Rails are arguably the most productive combination for launching an application from scratch.

The book is structured so that you can immediately start building an application and then enhance it as you learn new concepts. Even if you only have a few hours a week that will be enough to work through the book in a few weeks and build the first version of your application along side it.

## Frequently Asked Questions

**I'm having issues with the book. Who can I contact?**

Oh no! Send an email to [me@radanskoric.com](mailto:me@radanskoric.com).

**How much will the book cost?**

The book is currently in Beta and selling for <b>€28</b>. For that price you will receive the fully completed part I (see list of chapters above for details), and lifetime access to all future versions.

**What is included in the beta version purchase?**

Immediately upon purchase you will receive a PDF of the current version of the book. The list of chapters above outlines exactly what is currently finished.

You will also receive all future updates to the PDF version and all future format additions. A website version is in the process of being created and an epub version is planned in the future. You will get all of that included for the beta price and will get life time access to all updates to the book.

**Is there a money back guarantee?**

If, for any reason, you find yourself less than fully satisfied with the book, you may request a refund any time within 30 days of the purchase. Just send an e-mail to [me@radanskoric.com](mailto:me@radanskoric.com) and include your reason for requesting the refund.

**Can I get an invoice?**

Absolutely! After making a purchase you will automatically receive a receipt. If you need a more detailed invoice, just [e-mail me](mailto:me@radanskoric.com).

<%= render "cta" %>
