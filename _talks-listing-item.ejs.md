```{=html}
<div class="list quarto-listing-default">
<% for (const item of items) { %>
<%
  const hasEn = item.langs && item.langs.indexOf('en') !== -1;
  const displayEvent = (hasEn && item['event-en']) ? item['event-en'] : item.event;
  const displayTitle = (hasEn && item['title-en']) ? item['title-en'] : item.title;
  const displayDesc  = (hasEn && item['description-en']) ? item['description-en'] : item.description;
%>
<div class="quarto-post image-right" <%= metadataAttrs(item) %>>
<div class="body">
<h3 class="no-anchor listing-title">
<a href="<%- item.path %>" class="no-external">
<%= displayEvent || displayTitle %><span class="listing-arrow" aria-hidden="true">↗</span>
</a>
</h3>
<% if (item.langs && item.langs.length) { %>
<div class="listing-langs">
<% const langFlags = { fr: '🇫🇷', en: '🇬🇧' }; %>
<% for (let i = 0; i < item.langs.length; i++) {
     const lang = item.langs[i];
     const href = i === 0
       ? item.path
       : item.path
           .replace(/index(-[a-z]{2})?\.(qmd|html)$/, 'index-' + lang + '.$2')
           .replace(/\/$/, '/index-' + lang + '.html');
%>
<a href="<%- href %>" class="listing-lang" aria-label="<%= 'Open slides in ' + lang.toUpperCase() %>">
<span class="lang-flag" aria-hidden="true"><%= langFlags[lang] || '' %></span>
<span class="lang-code"><%= lang.toUpperCase() %></span>
</a>
<% } %>
</div>
<% } %>
<% if (displayDesc) { %>
<div class="delink listing-description"><a href="<%- item.path %>" class="no-external"><%= displayDesc %></a></div>
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
