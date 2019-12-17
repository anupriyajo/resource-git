# This file is part of resource-git.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM python:3.7-alpine

WORKDIR /opt

ADD server.py .
ADD pyproject.toml .
ADD poetry.lock .

RUN apk add --no-cache build-base libffi-dev openssl-dev git
RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install

ENTRYPOINT ["python3", "server.py"]
