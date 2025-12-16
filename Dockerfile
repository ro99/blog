FROM ruby:3.3.10-trixie

# Install System Dependencies
# texlive-latex-base: Basic LaTeX support
# texlive-pictures: TikZ and PGF
# texlive-latex-extra: Extra packages often needed
# pdf2svg: Required to convert generated PDFs to SVG
RUN apt-get update && apt-get install -y \
    texlive-latex-base \
    texlive-pictures \
    texlive-latex-extra \
    texlive-pstricks \
    texlive-science \
    pdf2svg \
    && rm -rf /var/lib/apt/lists/*

# Setup App Directory
WORKDIR /srv/jekyll

# Install Gems
COPY Gemfile .
RUN bundle install

# Default command (can be overridden)
CMD ["jekyll", "build"]