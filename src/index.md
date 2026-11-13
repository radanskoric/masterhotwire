---
layout: default
paddle: true
image: /images/hotwire-in-hands.png
---

<% sales_count = 300 %>
<% price = 49 %>

<script async data-uid="feaa96bc97" src="https://thoughtful-producer-2834.kit.com/feaa96bc97/index.js"></script>

<div class="top-right-container">
  <div class="sales-text">
    <div class="sales-number"><%= sales_count %>+</div>
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

<div class="top-left-container">
  <a href="https://book.masterhotwire.com" class="sign-in-link">reader sign-in</a>
</div>

<nav class="toc-desktop" aria-label="Table of contents">
  <ul class="toc-list">
    <li><a href="#build-modern-web-apps">Start here</a></li>
    <li><a href="#simple-and-fun">Modern UI can be simple</a></li>
    <li><a href="#html-over-the-wire">HTML-over-the-wire</a></li>
    <li><a href="#hotwire-mistake">Can Hotwire be a mistake?</a></li>
    <li><a href="#deep-understanding">Get a deep understanding</a></li>
    <li><a href="#hotwire-native">Power of Hotwire Native</a></li>
    <li><a href="#reviews">What readers are saying</a></li>
    <li><a href="#chapters">List of chapters</a></li>
    <li><a href="#side-project">Hotwire in an existing app</a></li>
    <li><a href="#faq">FAQ</a></li>
  </ul>
</nav>

# Master Hotwire
{: .mb-0}

![Boy hands holding two wires with a bright yellow spark between them](/images/hotwire-in-hands.png){: width="60%"}
{: .center.mt-0.mb-0}

For experienced Rails developers
{: .center.mb-0}

## Become as fluent with Hotwire as you are with Rails
{: #build-modern-web-apps .mt-0}

*A practical e-book to quickly get up to speed with Hotwire and Hotwire Native and understand how they work under the hood, so you can choose the right approach, debug with confidence, and build applications you can maintain for years.*

One purchase, three formats, lifetime updates.

Written by [Radan Skorić](https://radanskoric.com). [Watch my talk on Hotwire at RailsWorld 2025.](https://www.youtube.com/watch?v=kWFYc6qrXIo){: target="_blank"}

<div class="featured-review">
  <p>Recommended by a principal programmer at 37signals, the team behind Hotwire:</p>
  <%= render "review", review: site.data.reviews.find { |review| review[:name] == "Rosa Gutiérrez" } %>
</div>

## Can modern web UI be simple and fun to build?
{: #simple-and-fun}

Do you feel like the mainstream approaches to building a modern web UI have become too complicated? Coding agents can produce a working feature quickly. But you still need to understand how it works, whether it fits your application, and what will happen when you change it.

That gets harder when a single interaction spans backend logic, an API, frontend state, and a tree of components. You can delegate writing the code. You still need to be able to reason about the result.

Single Page Applications (SPAs) often introduce exactly these boundaries. They deliver a great UX but also bring many problems:
- 2 different applications (backend and frontend) that have to synchronise state.
- Business logic being duplicated between backend and frontend.
- A complex API to maintain.
- An arcane build system that regularly breaks.
- A whole frontend framework with its own conventions and lifecycle to understand when reviewing a change.
- A single feature can require coordinated changes across both applications, leaving more code and interactions to review.

Imagine easily following a feature from the user's action to your Rails code and back to the updated page, with fewer layers in between. Less machinery to understand. Fewer places for an unnecessary abstraction or duplicated rule to hide.
How good would that be?

## Is HTML-over-the-wire the fix?
{: #html-over-the-wire}

**Hotwire**, or HTML over the wire, keeps much of your UI logic where your application logic already lives: on the server. Rails renders the HTML, and Hotwire updates the page. You can build interactive interfaces without maintaining a separate frontend application for them.

Everything we need to render the correct HTML is already right here on the server, in our **backend logic**. It's crazy to have to serialise it to JSON, ship to a completely different frontend application, deserialise it, pass it through a dozen nested components which update the Virtual DOM which then, finally, finally, updates the counter widget. Yes, of course, I'm paraphrasing but I think you get the point. Each new moving piece is a potential source of bugs and complexity.

This is what **compression of complexity** means in practice: fewer layers, less duplicated state, and more of the feature expressed in familiar Rails code. That gives you a smaller system to understand when reviewing a change. It also gives a coding agent a more direct path to implementing it, with fewer boundaries to coordinate across.

## Can picking Hotwire turn out to be a mistake?
{: #hotwire-mistake}

However, Hotwire is not a free lunch. A poorly designed Hotwire application can:
- be hard to maintain
- end up being sluggish to use
- lead to higher server resource usage

An agent can produce working Hotwire code that still scatters logic across frames, streams, and controllers. You need enough understanding to spot when a straightforward feature is turning into a workaround.

## "I am trying to understand it and find it extremely convoluted"
{: #convoluted}

Whether you write the code yourself or review an agent's work, these are the warning signs to look for:
- Long brittle update logic turning Rails controllers into a spaghetti mess.
- Related logic scattered across the app through naive use of Turbo Frames.
- UI that leaves you wondering "where is this piece even coming from??"
- Hard to follow workarounds for things that don't work out of the box with Turbo.
- Features that break in strange ways.

Just like Ruby and Ruby on Rails, Hotwire is a sharp knife. Learning to use it well lets you get a lot done without cutting yourself.

### Used correctly it will not be a mistake

It's absolutely possible to build a complex application with Hotwire that's maintainable and a joy to work on.

However, you do need to:
- Build the correct mental model of how it works.
- Understand the tradeoffs being made.
- Learn to compose the solution in a Hotwire friendly way.
- Gain an understanding of the inner workings of Hotwire.

### What would it mean if you were as fluent with Hotwire as you are with Rails itself?

You could:
- Understand what changed and why, even when an agent wrote the code.
- Recognize when a proposed solution adds unnecessary complexity.
- Give agents clearer direction about how a feature should fit your application.
- Debug across Rails and Hotwire without treating the frontend as a black box.
- Build a side-project you can confidently return to and extend.
- Recapture the joy of developing applications you understand.

A simpler architecture gives both you and your agents fewer moving parts to keep track of. Understanding Hotwire lets you preserve that simplicity as the application grows. You can delegate more of the implementation while staying in **control** of the codebase.

"Master Hotwire" builds that understanding through step-by-step lessons: you develop a collaborative Kanban board application and learn how each part of Hotwire works under the hood.

<%= render "cta", price: price, show_review: true %>

![An image of Turbo Frames chapter in the web version of the book](/images/web-version-turbo-frames.png){: .fade-vertical width="100%"}
*The web version of the book*
{: .center }

## "How would you implement this UI with Hotwire?"
{: #how-would-you-implement}

A common question is how should a particular UI be implemented using Hotwire.

You already know how the actual problem solving part should be implemented but you *don't* know how it should be *assembled* using Hotwire in an **elegant and maintainable** way.

What if:
- You knew exactly how to implement complex features using Hotwire?
- You knew how to keep everything simple and performant?

You could focus most of your energy on the really interesting part, on the part of the code that is actually solving the user problem.

That is the goal of the project in "Master Hotwire".

Each bite-sized lesson adds to the collaborative *Kanban board application*, with knowledge you can apply from the very first lesson. You can also develop your own application in parallel, using each new concept as you learn it.

![An image sample of Kanban board building part](/images/pdfsamplecodealong.png){: .fade-vertical width="100%"}
*The PDF version of the book*
{: .center }

## Get a deep understanding to implement the best solution
{: #deep-understanding}

Official documentation and most online tutorials and courses explain how to **use** Hotwire. That is enough for you to build your application but it's not enough to really know if you picked the best approach and built a long term maintainable application. It's not enough to quickly fix unexpected issues. For that you need a **deep understanding**.

After introducing each concept, the book takes another step and explains how each part of Hotwire actually works under the hood. This is what you need to know that you picked the best solution. This is what enables you to debug issues in **minutes, not hours**.

![An image sample of a deep dive chapter](/images/pdfsampledeepdive.png){: .fade-vertical width="100%"}
*A sample of a deep dive chapter from the PDF version of the book*
{: .center }

### What if you're too busy?

You're probably busy, you don't have much time to read another **book**.

This is why the book is aimed at **experienced** developers! Most tutorials spend a lot of time with the basics. But you're experienced and you don't need that much hand holding.

Because you are experienced, I can condense the material, **saving you time**. I can then dig under the hood, giving you a **deeper understanding**. A junior developer would be overwhelmed by it but for you this might be the most interesting part.

It's condensed experience that you are able to consume in a short amount of time because of your existing expertise.

Even with only a few hours a week, you can work through Part I in a few weeks, building a first version of your web application as you go.

You will gain an accurate mental model and understanding of Hotwire. You will be able to connect it to the body of knowledge and experience you already possess to build new applications or introduce Hotwire to existing ones with confidence.

### Can you bring your Rails application to mobile without rebuilding it?
{: #hotwire-native}

Once you have a web application, Part II explores how to bring it to mobile with Hotwire Native.

For suitable projects, Hotwire Native lets you reuse your existing web application inside a native app. Much of your application logic and UI stays in one place, instead of becoming a second implementation you have to keep in sync. You can add native behavior where the mobile experience calls for it.

However, it's not the right fit for every project. Thankfully, the same deep understanding of how it works and how to use it properly will give you a clear understanding of when to use it.

Part II explains those tradeoffs as you build, without requiring you to spend a lot of time learning native development. When you finish Part II you will understand how it works and you'll be able to build and launch a native app mostly using your existing web development skills. For a lot of projects this is more than enough. And if you need to push it further, you'll be able to use any native development resources. Hotwire Native enables that and "Master Hotwire" gives you the needed understanding.

And Hotwire Native provides an almost perfect division of labour between your and your coding agent: the agent can implement native components that you then compose from the comfort of the web.

<div class="sales-in-text"><%= sales_count %>+ copies sold</div>

### Available in 3 formats

<div class="formats-grid" aria-label="Book formats">
  <div class="format-card">
    <div class="format-title">Web</div>
    <div class="format-description">Easy to read, easy to copy code snippets.</div>
  </div>
  <div class="format-card">
    <div class="format-title">PDF</div>
    <div class="format-description">Printable, easy to annotate.</div>
  </div>
  <div class="format-card">
    <div class="format-title">EPUB</div>
    <div class="format-description">For your Kindle or other e-reader.</div>
  </div>
</div>

<%= render "cta", price: price %>

## What readers are saying
{: #reviews}

<%= render "reviews" %>

## List of chapters
{: #chapters}

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
  - 1.12. End of Part I
- 2.0. Part II: Where you learn how to package a web app into native mobile apps with Hotwire Native
  - 2.1. History of Hotwire Native
  - 2.2. Mobile apps UI is different from the web
  - 2.3. Create a new Hotwire Native application
  - 2.4. Enhance the application without custom native code
  - 2.5. Customise mobile screens with Path Configuration
  - 2.6. Utilise Bridge Components
  - 2.7. Publish native applications
  - 2.8. Where to go from here?
- 3.0. Part III: Where you learn how to take it further
  - 3.1. Understand how Turbo Cache manages browsing history
  - 3.2. Advanced Stimulus usage
  - 3.3. A primer on system testing Hotwire apps
  - 3.4. Adding Turbo to a legacy application
  - 3.5. How to debug Hotwire applications
- 4.0. What's next?

## Bring Hotwire into your existing application
{: #side-project}

If your day job is a huge legacy application, switching to Hotwire might seem like an impossible task. You need to understand how it fits into the application you already have.

The chapter "Adding Turbo to a legacy application" addresses that challenge directly. The mental model you build throughout the book gives you a foundation for deciding where Hotwire can help in your own codebase.

## Frequently Asked Questions
{: #faq}

**Why learn Hotwire if a coding agent can write it for me?**

An agent can help you implement a feature, but you still need to judge the approach, review the changes, and understand failures. Learning how Hotwire works gives you the vocabulary to guide the agent and the mental model to evaluate its output. The book builds that understanding through a concrete application and explanations of the internals.

**Why buy the book when the official documentation is free?**

The official documentation is a useful reference, and you'll still use it alongside the book. You can also learn a lot from free tutorials and reading the source code.

The book saves you the work of piecing those lessons together. You build a collaborative application step by step, learn how each feature works under the hood, and see how the pieces fit together into a maintainable application. That gives you a structured path to understanding the tradeoffs, choosing an approach, and debugging when something goes wrong.

**How much does the book cost?**

The book is priced at <b>€<%= price %></b>. For that price you will receive the book (see list of chapters above for details), and lifetime access to all future versions and updates.

**What is included in the purchase?**

Immediately upon purchase you will receive access to the always up to date Web, PDF and EPUB versions of the book. The list of chapters above outlines the content.

Your purchase includes lifetime access to all future updates, at no extra cost.

You always have access to the latest version of the book in all formats through the reader's area at: [book.masterhotwire.com](https://book.masterhotwire.com){:target="_blank"}.

**Is there a money back guarantee?**

You can request a full refund any time within 30 days of purchase, no questions asked. Just send an e-mail to [me@radanskoric.com](mailto:me@radanskoric.com). You do not need to provide a reason.

**Can I get an invoice?**

Absolutely! After making a purchase you will automatically receive a receipt. If you need a more detailed invoice, just [e-mail me](mailto:me@radanskoric.com).

**Do you have team licenses?**

Yes, I do! Email me at [me@radanskoric.com](mailto:me@radanskoric.com) and I will send you a payment link and set up a license for your team.
You will need a business domain and the license works by allowing anyone with an e-mail on the provided domain automatic access to the book, via the book's web version at [book.masterhotwire.com](https://book.masterhotwire.com){:target="_blank"}. The price of the team license is €<%= price * 5 %>.

**I'm having issues with the book. Who can I contact?**

Oh no! Send an email to [me@radanskoric.com](mailto:me@radanskoric.com).

<%= render "cta", price: price %>
