# Dillinger

# *The Last Markdown Editor, Ever*

Dillinger is a cloud-enabled, mobile-ready, offline-storage compatible, <br>
Angular JS-powered HTML5 Markdown editor. <br>

   - Type some Markdown on the left
   - See HTML in the right  
   - :sparkles:Magic:sparkles:

# Features
   - Import a HTML file and watch it magically convert to Markdown
   - Drag and drop images (requires your Dropbox account be linked)
   - Inport and save files from GitHub, Dropbox, Google Drive and One Drive
   - Drag and drop markdown and HTML files into Dillinger
   - Export documents as Markdown, HTML, and PDF

Markdown is a lightweight markup language based on the formatting conventions<br>
that people naturally use in email.<br>
As [John Gruber](www.Wikipedia.org "John Gruber") writes on the [Markdown site](https://ko.wikipedia.org/wiki/%EB%A7%88%ED%81%AC%EB%8B%A4%EC%9A%B4 "Markdown site")
```
for i in range(10):
   print(hello)
```
> *The overridng desigh goal for Markdown's*<br>
> *formatting syntax is to make it as readable*<br>
> *as possible. The idea is that a*<br>
> *Markdown-formatted document should be*<br>
> *publishable as-is, as plain text, without*<br>
> *looking like it's been marked up with tags*<br>
> *or formatting instructions.*<br>

This text you see here is \*actually-written in Markdown! To get a feel<br>
for Markdown's syntax, type some text into the left window and<br>
watch the results in the right.<br>

# Tech
Dillinger uses a number of open source projects to work properly:<br>

- [Angular JS](www.wikipedia.org "Angular JS") - HTML enhanced for web apps!
- [Ace Editor](www.wikipedia.org "Ace Editor") - awesome web-based text editor
- [markdown-it](www.wikipedia.org "markdown-it") - markdown parser done right. Fast and easy to extend. 
- [Twitter Bootstrap](www.wikipedia.org "Twitter Boostrap") - great UI boilerplate for modern web apps
- [node.js](www.wikipedia.org "node.js") - evented I/O for the backend
- [Express](www.wikipedia.org "Express") - fast node.js network app framework [@tjholowaychuk](@tjholowaychuk "@tjholowaychuk")
- [Gulp](www.wikipedia.org "Gulp") - the streaming build system
- [Breakdance](www.wikipedia.org "") - HTML

# Installation
Dillinger requires [node.js](www.wikipedia.org "node.js") v10+ to run.<br>

Install the dependencies and devDependencies and start the server.<br>

```
cd dillinger
npm i
node app
```

For production environments...

```
npm install --production
NODE_ENV=production node app
```

# Plugins
Dillinger is currently extended with the following plugins. <br>
Instructions on how to use them in your own application are linked below.<br>

|**Plugin**|**README**|
|:---|:---|
|Dropbox|[plugins/dropbox/README.md](plugins/dropbox/README.md)|
|Github|[plugins/github/README.md](plugins/github/README.md)|
|Google Drive|[plugins/googledrive/README.md](plugins/googledrive/README.md)|
|OneDrive|[plugins/onedrive/README.md](plugins/onedrive/README.md)|
|Medium|[plugins/medium/README.md](plugins/medium/README.md)|

# Development
Want to contribute? Great!<br>

Dillinger uses Gulp + Webpack for fast developing.<br>
Make a change in your file and instantaneously see your updates!<br>

Open your favorite Terminal and run these commands.<br>

First Tab:
```
node app
```

Second Tab:
```
gulp watch
```

(optional) Third:
```
karma test
```
## Building for source
For production release:
```
gulp build --prod
```