```{=html}
<div class="list quarto-listing-default">
<% for (const item of items) { %>
<div class="quarto-post image-right" <%= metadataAttrs(item) %>>
<div class="body">
<h3 class="no-anchor listing-title">
<a href="<%- item.path %>" class="no-external">
<%= item.event || item.title %><span class="listing-arrow" aria-hidden="true">↗</span>
</a>
</h3>
<% if (item.categories) { %>
<div class="listing-categories">
<% for (const category of item.categories) { %>
<div class="listing-category" onclick="window.quartoListingCategory('<%= utils.b64encode(category) %>'); return false;"><%= category %></div>
<% } %>
</div>
<% } %>
<% if (item.description) { %>
<div class="delink listing-description"><a href="<%- item.path %>" class="no-external"><%= item.description %></a></div>
<% } %>
</div>
<div class="metadata">
<a href="<%- item.path %>" class="no-external">
<% if (item.date) { %>
<div class="listing-date"><%= item.date %></div>
<% } %>
</a>
</div>
</div>
<% } %>
</div>
```
